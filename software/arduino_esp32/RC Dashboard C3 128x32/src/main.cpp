#include <Arduino.h>
#include <U8g2lib.h>
#include <ServoInput.h>
#include "constants.h"
#include "settings.h"
#include "images.h"

const int ch1_signal_pin = PIN_CH1;
ServoInputPin<ch1_signal_pin> channel1(CH1_PULSE_MIN, CH1_PULSE_MAX);

const int ch2_signal_pin = PIN_CH2;
ServoInputPin<ch2_signal_pin> channel2(CH2_PULSE_MIN, CH2_PULSE_MAX);

U8G2_SSD1306_128X32_UNIVISION_1_SW_I2C u8g2(U8G2_R0, /* clock=*/ PIN_SCL, /* data=*/ PIN_SDA, /* reset=*/ U8X8_PIN_NONE);

int last_pulse = 0;
long last_value = 0;
long current_value = 0;
bool value_changed = true;

double corrected;
byte num_blanks, blank_start;
byte current_gear = GEAR_NEUTRAL;

long gauge_value;

long last_boot = millis();
bool boot_done = false;
bool led_value = false;
bool display_started = false;
unsigned long led_timer = -1;

/* Values are what we want the values to be, unless overridden by things such
 * as warning indicators. The actual value is what it's currently set to,
 * fading between the values as needed.
 */
int led_1_value = 0;
int led_1_actual = 0;
int led_2_value = 0;
int led_2_actual = 0;

int map_input() {
  /* Disable interrupts to increase accuracy */
  // noInterrupts();
  // last_pulse = pulseIn(PIN_CH2, HIGH, 25000);
  // interrupts();

  // if (last_pulse == 0) return 0;

	// if (last_pulse <= THROTTLE_PULSE_MIN) return -100;
	// if (last_pulse >= THROTTLE_PULSE_MAX) return 100;
  // return map(last_pulse, THROTTLE_PULSE_MIN, THROTTLE_PULSE_MAX, -100, 100);
  return channel2.map(-100, 100);
}


/* This will read the channel2 value, but take note that current_value will
 * read as 0 (stick in neutral position) even while a signal is not present
 * such as when it isn't connected to the receiver.
 */
void read_throttle() {
  current_value = map_input();
  value_changed = true;
  // if (last_pulse != 0) {
  //   value_changed = (current_value != last_value);
  //   last_value = current_value;
  // } else {
  //   value_changed = false;
  // }
}


/* While the values we end up with can be considered to be between -100
 * and 100, zero being neutral, we need something slightly less fuzzy to
 * work with. Generally we use the low threshold in both direction as a
 * configurable deadzone, placing the gears to each side of it.
 */
byte get_gear() {
  if (current_value > LOW_THRESHOLD) return GEAR_DRIVE;
  if (current_value < -(LOW_THRESHOLD)) return GEAR_REVERSE;
  return GEAR_NEUTRAL;
}


void draw_bezel() {
  u8g2.drawXBMP(
    0, 
    0, 
    128, 
    32, 
    image_dashboard
  );
}


void draw_logo() {
  u8g2.drawXBMP(
    8, 
    8, 
    96, 
    16,
    image_boot
  );
}


/* It's a manual, sort of. There's no any actual transmission in a scale
 * sense, so we'll just put up 4 gears and be done with it. 
 */
void draw_manual() {
  switch (current_gear) {
    case GEAR_DRIVE:
      if (gauge_value > 70) {
        u8g2.drawXBMP(
          111, 
          7, 
          16, 
          16, 
          image_gear_manual_4
        );
        return;
      }

      if (gauge_value < 15) {
        u8g2.drawXBMP(
          111, 
          7, 
          16, 
          16, 
          image_gear_manual_1
        );
        return;
      }

      if (gauge_value < 40) {
        u8g2.drawXBMP(
          111, 
          7, 
          16, 
          16, 
          image_gear_manual_2
        );
        return;
      }

      u8g2.drawXBMP(
        111, 
        7, 
        16, 
        16, 
        image_gear_manual_3
      );
      return;

    case GEAR_REVERSE:
      u8g2.drawXBMP(
        111, 
        7, 
        16, 
        16, 
        image_gear_manual_r
      );
      return;

    default:
      u8g2.drawXBMP(
        111, 
        7, 
        16, 
        16, 
        image_gear_manual_1
      );
      return;
  }
}


/* Set image according to which gear we're in... it's an automatic so it's 
 * Drive, Reverse or Neutral. 
 */
void draw_automatic() {
  switch (current_gear) {
    case GEAR_DRIVE:
      u8g2.drawXBMP(
        112, 
        8, 
        15, 
        16, 
        #ifdef GEARS_ALT
          image_gear_alt_drive
        #else
          image_gear_drive
        #endif
      );
      break;

    case GEAR_REVERSE:
      u8g2.drawXBMP(
        112, 
        8, 
        15, 
        16, 
        image_gear_manual_r
      );
      break;

    case GEAR_NEUTRAL:
    case GEAR_PARKED:
    default:
      u8g2.drawXBMP(
        112, 
        8, 
        15, 
        16, 
        #ifdef GEARS_ALT
          image_gear_alt_neutral
        #else
          image_gear_neutral
        #endif
      );
      break;
  }
}


void draw_gear() {
  #ifdef GEARS_MANUAL
    draw_manual();
  #else
    draw_automatic();
  #endif
}


void draw_gauge() {
  u8g2.drawXBMP(
    8, 
    8, 
    96, 
    16, 
    #if GAUGE_STYLE == 2
      image_gauge2
    #elif GAUGE_STYLE == 3
      image_gauge3
    #else
      image_gauge1
    #endif
  );

  blank_start = map(gauge_value, 0, 100, 0, 96 - 1);
  #ifdef LIMIT_REVERSE
    if (current_gear == GEAR_REVERSE) {
      blank_start = map(gauge_value, 0, 100, 0, LIMIT_REVERSE - 1);
    }
  #endif
  num_blanks = 96 - blank_start;

  u8g2.setDrawColor(0);
  u8g2.drawBox(8 + blank_start, 8, num_blanks, 16);
  u8g2.setDrawColor(2);
}


//variables to keep track of the timing of recent interrupts
unsigned long switch_updated = 0;  
unsigned long last_switch_time = 0; 

bool switch_was_pushed = false;

void IRAM_ATTR switch_pushed() {
  switch_updated = millis();
  if (switch_updated - last_switch_time > 250) {
    switch_was_pushed = true;
    last_switch_time = switch_updated;
  }
}


void setup() {
  pinMode(PIN_BOOT, INPUT_PULLUP);
  attachInterrupt(PIN_BOOT, switch_pushed, FALLING);

  pinMode(PIN_CFG, INPUT_PULLUP);

  pinMode(LED_BUILTIN, OUTPUT);
  digitalWrite(LED_BUILTIN, HIGH);
  pinMode(LED_1, OUTPUT);
  digitalWrite(LED_1, LOW);
  pinMode(LED_2, OUTPUT);
  digitalWrite(LED_2, LOW);

  channel2.attach();
}


void show_boot() {
  draw_bezel();
  draw_gear();
  draw_logo();

  if ((millis() - last_boot) > BOOT_DURATION) {
    boot_done = true;
  }
}


unsigned long last_blinker_update = -1;
void show_unconnected() {
  if (led_timer == -1) {
    led_timer = millis();
    last_blinker_update = millis();

    led_value = true;
    digitalWrite(LED_BUILTIN, led_value ? HIGH : LOW);
    analogWrite(LED_1, led_value ? LED_1_HIGH : LED_1_LOW);
    analogWrite(LED_2, led_value ? LED_2_HIGH : LED_2_LOW);
  }

  if ((millis() - led_timer) > BLINKER_SPEED) {
    led_timer = millis();
    led_value = !led_value;

    digitalWrite(LED_BUILTIN, led_value ? HIGH : LOW);
  }

  if ((millis() - last_blinker_update) > 20) {
    last_blinker_update = millis();

    unsigned long diff = millis() - led_timer;
    if (diff > BLINKER_SPEED) diff = BLINKER_SPEED;
    if (led_value) {
      analogWrite(LED_1, map(diff, 0, BLINKER_SPEED, LED_1_HIGH, LED_1_LOW));
      analogWrite(LED_2, map(diff, 0, BLINKER_SPEED, LED_2_HIGH, LED_2_LOW));
    } else {
      analogWrite(LED_1, map(diff, 0, BLINKER_SPEED, LED_1_LOW, LED_1_HIGH));
      analogWrite(LED_2, map(diff, 0, BLINKER_SPEED, LED_2_LOW, LED_2_HIGH));
    }
  }

  draw_bezel();
  draw_gear();
  draw_logo();
}

void clear_unconnected() {
  if (led_timer != -1) {
    led_timer = -1;

    analogWrite(LED_1, led_1_value);
    analogWrite(LED_2, led_2_value);
  }
}


void show_gauges() {
  read_throttle();
  if (value_changed) {
    current_gear = get_gear();
    gauge_value = current_value;
    if (gauge_value < 0) gauge_value = -gauge_value;
  }

  draw_bezel();
  draw_gear();
  draw_gauge();
}


void process_switch() {
  if (switch_was_pushed) {
    switch_was_pushed = false;

    if (led_1_value < LED_1_LOW) {
      led_1_value = LED_1_LOW;
      return;
    }

    if (led_1_value < LED_1_HIGH) {
      led_1_value = LED_1_HIGH;
      return;
    }

    led_1_value = 0;
  }
}


int next_led_value(int current, int max) {
  current = current + 10;
  if (current > max) current = max;
  return current;
}


int previous_led_value(int current) {
  current = current - 10;
  if (current < 0) current = 0;
  return current;
}


void process_leds() {
  if (led_1_value > led_1_actual) {
    led_1_actual = next_led_value(led_1_actual, LED_1_HIGH);
    analogWrite(LED_1, led_1_actual);
  }

  if (led_1_value < led_1_actual) {
    led_1_actual = previous_led_value(led_1_actual);
    analogWrite(LED_1, led_1_actual);
  }
}


void delay_start() {
  unsigned long start = millis();
  unsigned long diff;

  analogWrite(LED_1, LED_1_LOW);
  analogWrite(LED_2, LED_2_LOW);

  do {
    diff = millis() - start;
    analogWrite(LED_1, map(diff, 0, START_DELAY, LED_1_LOW, LED_1_HIGH));
    analogWrite(LED_2, map(diff, 0, START_DELAY, LED_2_LOW, LED_2_HIGH));
    delay(10);
  } while (diff < START_DELAY);

  analogWrite(LED_1, LED_1_HIGH);
  analogWrite(LED_2, LED_2_HIGH);
}


void loop() {
  /* This seems stupid, but for some reason u8g2 fails to initialize properly
   * without it. Until there's an explanation for the reason, I guess I need
   * to keep the delays in place.
   */
  if (!display_started) {
    delay_start();
    u8g2.begin();

    display_started = true;
  }

  u8g2.firstPage();
  do {
    if (!boot_done) {
      show_boot();
      continue;
    }

    if (!ServoInput.anyAvailable()) {
      show_unconnected();
      continue;
    } else {
      clear_unconnected();
    }

    process_switch();
    process_leds();
    show_gauges();
  } while ( u8g2.nextPage() );
}
