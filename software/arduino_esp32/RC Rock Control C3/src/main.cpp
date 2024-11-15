#include <Arduino.h>
#include <ServoInput.h>
#include "constants.h"
#include "settings.h"

const int ch1_signal_pin = PIN_CH1;
ServoInputPin<ch1_signal_pin> channel1(CH1_PULSE_MIN, CH1_PULSE_MAX);

const int ch2_signal_pin = PIN_CH2;
ServoInputPin<ch2_signal_pin> channel2(CH2_PULSE_MIN, CH2_PULSE_MAX);

struct Channel {
  int value;
  int last_value;
  bool changed;
  byte state;
  bool available;
};
Channel CH1 = { 0, 0, true, STATE_IDLE, false };
Channel CH2 = { 0, 0, true, STATE_IDLE, false };

struct LED {
  const uint8_t pin;
  const uint8_t low;
  const uint8_t high;

  int value;
  int actual;
};

LED LED_FRONT_LEFT = { PIN_LED_1, LED_1_LOW, LED_1_HIGH, LED_1_DEFAULT, 0 };  // LED1
LED LED_REAR_LEFT = { PIN_LED_2, LED_2_LOW, LED_2_HIGH, LED_2_DEFAULT, 0 };   // LED2
LED LED_REAR_RIGHT = { PIN_LED_3, LED_3_LOW, LED_3_HIGH, LED_3_DEFAULT, 0 };  // LED3
LED LED_FRONT_RIGHT = { PIN_LED_4, LED_4_LOW, LED_4_HIGH, LED_4_DEFAULT, 0 }; // LED4

bool builtin_value = false;
unsigned long builtin_timer = -1;

void set_led(LED *led, int new_value) {
  led->value = new_value;
}


void write_led(LED *led, int new_value) {
  led->actual = new_value;
  analogWrite(led->pin, new_value);
}


int map_value(Channel *channel, bool available, long new_value) {
  channel->last_value = channel->value;
  channel->value = new_value;
  channel->changed = true; //(channel->last_value != channel->value);
  channel->available = available;

  if (channel->changed) {
    channel->state = STATE_IDLE;
    if (channel->value > LOW_THRESHOLD) channel->state = STATE_POSITIVE;
    if (channel->value < -(LOW_THRESHOLD)) channel->state = STATE_NEGATIVE;
  }
  return AUX_INVALID;
}


/* This will read the channel2 value, but take note that current_value will
 * read as 0 (stick in neutral position) even while a signal is not present
 * such as when it isn't connected to the receiver.
 */
void read_values() {
  // Steering
  // map_value(&CH1, true, channel1.map(-100, 100));
  map_value(&CH1, channel1.available(), channel1.map(-100, 100));

  // Throttle
  map_value(&CH2, true, channel2.map(-100, 100));
  // map_value(&CH2, channel2.available(), channel2.map(-100, 100));
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


void setup_led(LED *led) {
  pinMode(led->pin, OUTPUT);
  write_led(led, 0);
}


void setup() {
  pinMode(PIN_BOOT, INPUT_PULLUP);
  attachInterrupt(PIN_BOOT, switch_pushed, FALLING);

  pinMode(PIN_CFG, INPUT_PULLUP);

  pinMode(LED_BUILTIN, OUTPUT);
  digitalWrite(LED_BUILTIN, HIGH);

  setup_led(&LED_FRONT_LEFT);
  setup_led(&LED_REAR_LEFT);
  setup_led(&LED_REAR_RIGHT);
  setup_led(&LED_FRONT_RIGHT);

  channel1.attach();
  channel2.attach();
}


void process_switch() {
  if (switch_was_pushed) {
    switch_was_pushed = false;

    // do things
  }
}


int next_led_value(int current, int max) {
  current = current + LED_STEPS;
  if (current > max) current = max;
  return current;
}


int previous_led_value(int current) {
  current = current - LED_STEPS;
  if (current < 0) current = 0;
  return current;
}


void update_led(LED *led) {
  if (led->value > led->actual) {
    write_led(led, next_led_value(led->actual, led->high));
  }
  if (led->value < led->actual) {
    write_led(led, previous_led_value(led->actual));
  }
}


void process_dual() {

}


void process_single() {
  if (CH2.state == STATE_POSITIVE) {
    set_led(&LED_FRONT_LEFT, map(CH2.value, 0, 100, LED_FRONT_LEFT.low, LED_FRONT_LEFT.high));
    set_led(&LED_FRONT_RIGHT, map(CH2.value, 0, 100, LED_FRONT_RIGHT.low, LED_FRONT_RIGHT.high));
    set_led(&LED_REAR_LEFT, 0);
    set_led(&LED_REAR_RIGHT, 0);
  }

  if (CH2.state == STATE_NEGATIVE) {
    set_led(&LED_FRONT_LEFT, 0);
    set_led(&LED_FRONT_RIGHT, 0);
    set_led(&LED_REAR_LEFT, map(CH2.value, -100, 0, LED_REAR_LEFT.high, LED_REAR_LEFT.low));
    set_led(&LED_REAR_RIGHT, map(CH2.value, -100, 0, LED_REAR_RIGHT.high, LED_REAR_RIGHT.low));
  }

  if (CH2.state == STATE_IDLE) {
    set_led(&LED_FRONT_LEFT, 0);
    set_led(&LED_FRONT_RIGHT, 0);
    set_led(&LED_REAR_LEFT, 0);
    set_led(&LED_REAR_RIGHT, 0);
  }
}

void process_leds() {

  if (CH1.available && CH2.available) {
    //process_dual();
    process_single();
  } else {
    process_single();
  }

  update_led(&LED_FRONT_LEFT);
  update_led(&LED_FRONT_RIGHT);
  update_led(&LED_REAR_LEFT);
  update_led(&LED_REAR_RIGHT);
}


unsigned long blinker_updated = -1;
unsigned long blinker_diff;
void is_unconnected() {
  if (builtin_timer == -1) {
    builtin_timer = millis();
    blinker_updated = millis();

    builtin_value = true;
    digitalWrite(LED_BUILTIN, builtin_value ? HIGH : LOW);
    write_led(&LED_FRONT_LEFT, builtin_value ? LED_FRONT_LEFT.high : LED_FRONT_LEFT.low);
    write_led(&LED_REAR_LEFT, builtin_value ? LED_REAR_LEFT.high : LED_REAR_LEFT.low);
    write_led(&LED_REAR_RIGHT, builtin_value ? LED_REAR_RIGHT.high : LED_REAR_RIGHT.low);
    write_led(&LED_FRONT_RIGHT, builtin_value ? LED_FRONT_RIGHT.high : LED_FRONT_RIGHT.low);
  }

  if ((millis() - builtin_timer) > BLINKER_SPEED) {
    builtin_timer = millis();
    builtin_value = !builtin_value;

    digitalWrite(LED_BUILTIN, builtin_value ? HIGH : LOW);
  }

  if ((millis() - blinker_updated) > 20) {
    blinker_updated = millis();

    blinker_diff = millis() - builtin_timer;
    if (blinker_diff > BLINKER_SPEED) blinker_diff = BLINKER_SPEED;
    if (builtin_value) {
      write_led(&LED_FRONT_LEFT, map(blinker_diff, 0, BLINKER_SPEED, LED_1_HIGH, LED_1_LOW));
      write_led(&LED_REAR_LEFT, map(blinker_diff, 0, BLINKER_SPEED, LED_2_HIGH, LED_2_LOW));
      write_led(&LED_REAR_RIGHT, map(blinker_diff, 0, BLINKER_SPEED, LED_3_HIGH, LED_3_LOW));
      write_led(&LED_FRONT_RIGHT, map(blinker_diff, 0, BLINKER_SPEED, LED_4_HIGH, LED_4_LOW));
    } else {
      write_led(&LED_FRONT_LEFT, map(blinker_diff, 0, BLINKER_SPEED, LED_1_LOW, LED_1_HIGH));
      write_led(&LED_REAR_LEFT, map(blinker_diff, 0, BLINKER_SPEED, LED_2_LOW, LED_2_HIGH));
      write_led(&LED_REAR_RIGHT, map(blinker_diff, 0, BLINKER_SPEED, LED_3_LOW, LED_3_HIGH));
      write_led(&LED_FRONT_RIGHT, map(blinker_diff, 0, BLINKER_SPEED, LED_4_LOW, LED_4_HIGH));
    }
  }
}


void clear_unconnected() {
  builtin_timer = -1;
}


void loop() {
  if (ServoInput.anyAvailable()) {
    clear_unconnected();
    read_values();
    process_switch();
    process_leds();
    delay(20);
  } else {
    is_unconnected();
  }
}
