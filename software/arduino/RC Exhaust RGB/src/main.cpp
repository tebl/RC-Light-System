#include <Arduino.h>
#include "constants.h"
#include "settings.h"

int last_pulse = 0;
long last_value = 0;
long current_value = 0;
bool value_changed = false;

double corrected;
byte num_blanks, blank_start;
byte current_gear = GEAR_NEUTRAL;
byte last_gear = -1;
bool gear_changed = false;
long gauge_value;

unsigned long last_max_value = millis();

uint8_t glow = 0;
uint8_t flicker_cycle = 0;
uint8_t backfire_cycle = BACKFIRE_CYCLES;
unsigned long last_update = millis();
unsigned int change_delta = 150;

/* LEDs are reverse-biased, so the actual value to use with them is at the
 * opposite end of the spectrum (0 is full, 255 is off).
 */
uint8_t adjust_rgb(const uint8_t pin, const uint8_t value) {
  return LED_MAX - value;
  // return pgm_read_byte(&gamma_values[LED_OFF - value]);
}

/* If there's a need to sort out any kind of colour-specific tweaks, this
 * is probably the place to do it.
 */
void set_led(const uint8_t pin, const uint8_t value) {
  switch (pin) {
    default:
      analogWrite(pin, adjust_rgb(pin, value));
      break;
  }
}

int map_input() {
  /* Disable interrupts to increase accuracy */
  noInterrupts();
  last_pulse = pulseIn(PIN_THR, HIGH, 25000);
  interrupts();

  /* Second attempt at reading the value. This may be a mistake of my own doing
   * or something else entirely, but for some reason the second pulse read is
   * always more accurate.
   */
  noInterrupts();
  last_pulse = pulseIn(PIN_THR, HIGH, 25000);
  interrupts();

  if (last_pulse == 0) return 0;
  #ifdef THROTTLE_FUDGE
  /* It appears that we can't really rely on the values from pulseIn as it does
   * some calculation based on how long the chip takes to run through a certain
   * set of loops, this value is wrong for the DigiStump chips that I have. So
   * to get numbers we can work with, we'll have to work our way backwards
   * through the calculation and fudge the numbers a bit.
   * 
   * The way you can tell if this is the problem, it should appear as if the
   * speed going forward caps out early while reverse will appear as neutral
   * beyond a certain value (this is caused by an overflow in the Attiny core).
   */
  corrected = last_pulse + 16;
  corrected = (corrected) / 16.0;
  corrected = (corrected * THROTTLE_FUDGE);
  corrected = corrected - THROTTLE_FUDGE;
  last_pulse = corrected;
  #endif

	if (last_pulse <= THROTTLE_PULSE_MIN) return -100;
	if (last_pulse >= THROTTLE_PULSE_MAX) return 100;
  return map(last_pulse, THROTTLE_PULSE_MIN, THROTTLE_PULSE_MAX, -100, 100);
}

/* This will read the throttle value, but take note that current_value will
 * read as 0 (stick in neutral position) even while a signal is not present
 * such as when it isn't connected to the receiver.
 */
void read_throttle() {
  current_value = map_input();
  if (last_pulse != 0) {
    value_changed = (current_value != last_value);
    last_value = current_value;
  } else {
    value_changed = false;
  }
}

void setup() {
  pinMode(PIN_RGB_R, OUTPUT);
  pinMode(PIN_RGB_G, OUTPUT);
  pinMode(PIN_RGB_B, OUTPUT);
  pinMode(PIN_THR, INPUT);

  for (int i = 0; i < 2; i++) {
    set_led(PIN_RGB_R, LED_OFF);
    set_led(PIN_RGB_G, LED_OFF);
    set_led(PIN_RGB_B, LED_OFF);
    delay(100);
    set_led(PIN_RGB_R, LED_NOTICE);
    set_led(PIN_RGB_G, LED_NOTICE);
    set_led(PIN_RGB_B, LED_NOTICE);
    delay(100);
  }
  set_led(PIN_RGB_R, LED_OFF);
  set_led(PIN_RGB_G, LED_OFF);
  set_led(PIN_RGB_B, LED_OFF);
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

void analyze() {
  current_gear = get_gear();
  if (last_pulse != 0) {
    gear_changed = (current_gear != last_gear);
    last_gear = current_gear;
  } else {
    gear_changed = false;
  }
  
  gauge_value = current_value;
  if (gauge_value < 0) gauge_value = -gauge_value;
  if (current_gear != GEAR_NEUTRAL) {
    if (gauge_value > HIGH_THRESHOLD) {
      last_max_value = millis();
    }
  }

  if (gear_changed) {
    last_update = millis();
    flicker_cycle = 0;

    /* Start a new backfire sequence if we've returned to neutral with the
     * gauge at the maximum, meaning that we're driving it hard. Ideally,
     * because the logic falls apart somewhere.
     * 
     * @todo Maybe fix this.
     */
    if (current_gear == GEAR_NEUTRAL) {
      if ((millis() - last_max_value) < BACKFIRE_TIMER) {
        backfire_cycle = BACKFIRE_CYCLES;
      }
    }
  } else {
    switch (current_gear) {
      case GEAR_NEUTRAL:
        if (glow > 0) {
          glow--;
        }

        last_update = millis();
        break;

      case GEAR_DRIVE:
      case GEAR_REVERSE:
      default:
        /* Gauge value should a value from 0 to 100, using it as a time
         * difference so that glow accumulates faster under heavy throttle.
         */
        change_delta = 100 - gauge_value;

        if ((millis() - last_update) > change_delta) {
          if (glow < 255) {
            glow++;
          }
          last_update = millis();
        }  
        break;
    }
  }
}

void accelerate() {
  flicker_cycle++;

  switch (flicker_cycle % 16) {
    #ifndef LESS_FLICKER
      case 0:
        set_led(PIN_RGB_R, LED_LOW);
        set_led(PIN_RGB_G, LED_LOW);
        set_led(PIN_RGB_B, LED_OFF);
        break;
    #endif

    case 8:
      set_led(PIN_RGB_R, LED_MAX);
      set_led(PIN_RGB_G, LED_OFF);
      set_led(PIN_RGB_B, LED_OFF);
      break;

    default:
      set_led(PIN_RGB_R, glow);
      set_led(PIN_RGB_G, LED_OFF);
      set_led(PIN_RGB_B, LED_OFF);
      break;
  }
}

void backfire() {
  if (backfire_cycle > 0) {
    switch (flicker_cycle % 32) {
      #ifndef LESS_FLICKER
      case 20:
      case 22:
      case 24:
        set_led(PIN_RGB_R, LED_LOW);
        set_led(PIN_RGB_G, LED_LOW);
        set_led(PIN_RGB_B, LED_LOW);
        break;
      #endif

      case 28:
      case 29:
        set_led(PIN_RGB_R, LED_MAX);
        set_led(PIN_RGB_G, LED_OFF);
        set_led(PIN_RGB_B, LED_OFF);
        break;

      default:
        set_led(PIN_RGB_R, glow);
        set_led(PIN_RGB_G, LED_OFF);
        set_led(PIN_RGB_B, LED_OFF);
        break;
    }

    backfire_cycle--;
  }
  
  flicker_cycle++;
}

void loop() {
  read_throttle();
  if (last_pulse != 0) {
    analyze();

    switch (current_gear) {
      #ifndef NO_FLICKER
        // case GEAR_REVERSE:
        case GEAR_DRIVE:
          accelerate();
          break;
      
        case GEAR_NEUTRAL:
          if (glow > BACKFIRE_THRESHOLD) {
            backfire();
          } else {
            set_led(PIN_RGB_R, glow);
            set_led(PIN_RGB_G, LED_OFF);
            set_led(PIN_RGB_B, LED_OFF);
          }
          break;
      #endif
      
      default:
        set_led(PIN_RGB_R, glow);
        set_led(PIN_RGB_G, LED_OFF);
        set_led(PIN_RGB_B, LED_OFF);
        break;
    }
  }
}