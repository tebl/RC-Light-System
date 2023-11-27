#include <Arduino.h>
#include <ServoInput.h>
#include "constants.h"
#include "settings.h"

const int ThrottleSignalPin = PIN_THR;
ServoInputPin<ThrottleSignalPin> throttle(THROTTLE_PULSE_MIN, THROTTLE_PULSE_MAX);

const int SteeringSignalPin = PIN_STR;
ServoInputPin<SteeringSignalPin> steering(STEERING_PULSE_MIN, STEERING_PULSE_MAX);

// State variables
uint8_t led_state = 0x00;
bool emergency_cycle = false;
bool channels_dirty = false;

// Buffered values
int throttle_percent;
float steering_angle;
uint8_t last_led_state;
int last_thr_state;
int last_str_state;

void write_channels() {
  digitalWrite(SER_LATCH, LOW);
  shiftOut(SER_DATA, SER_CLK_1, MSBFIRST, led_state);
  digitalWrite(SER_LATCH, HIGH);
  channels_dirty = false;
}

bool sync_channels() {
  if (channels_dirty) {
    write_channels();
    return true;
  }
  return false;
}

void clear_channels() {
  led_state = 0x00;
  write_channels();
}

void set_channel(uint8_t number, bool value) {
  last_led_state = led_state;
  if (value) bitSet(led_state, number);
  else bitClear(led_state, number);
  if (last_led_state != led_state) {
    channels_dirty = true;
  }
}

void flash_emergency() {
  emergency_cycle = !emergency_cycle;
  led_state = 0x00;
  set_channel(LED_BL_L, emergency_cycle);
  set_channel(LED_BL_R, emergency_cycle);
  write_channels();
}

void setup() {
  pinMode(PIN_LED, OUTPUT);
  Serial.begin(115200);

  pinMode(SER_DATA, OUTPUT);
  pinMode(SER_LATCH, OUTPUT);
  pinMode(SER_CLK_1, OUTPUT);
  pinMode(SER_CLK_2, OUTPUT);
  clear_channels();
  while (!ServoInput.available()) {
    flash_emergency();
		delay(250);
	}
  clear_channels();
}

int get_thr_state() {
  throttle_percent = throttle.map(-100, 100);
  if (throttle_percent > 80) return THR_STICK_HIGH;
  if (throttle_percent > 10) return THR_STICK_LOW;
  if (throttle_percent < -80) return THR_STICK_REVERSE_HIGH;
  if (throttle_percent < -10) return THR_STICK_REVERSE_LOW;
  return THR_STICK_IDLE;
}

int get_str_state() {
  steering_angle = -(90 - steering.getAngle());
  if (steering_angle > 10) return STR_STICK_RIGHT;
  if (steering_angle < -10) return STR_STICK_LEFT;
  return STR_STICK_IDLE;
}

void on_idle() {
  switch (get_str_state()) {
    case STR_STICK_LEFT:
      set_channel(LED_BL_L, true);
      set_channel(LED_BL_R, false);
      break;

    case STR_STICK_RIGHT:
      set_channel(LED_BL_L, false);
      set_channel(LED_BL_R, true);
      break;

    default:
    case STR_STICK_IDLE:
      set_channel(LED_BL_L, false);
      set_channel(LED_BL_R, false);
      break;
  }
}

void on_control() {
  last_thr_state = get_thr_state();
  last_str_state = get_str_state();

  switch (last_thr_state) {
    case THR_STICK_REVERSE_HIGH:
      set_channel(LED_BR_A, true);
      set_channel(LED_BR_B, true);
      break;

    case THR_STICK_REVERSE_LOW:
      set_channel(LED_BR_A, true);
      set_channel(LED_BR_B, true);
      break;

    case THR_STICK_HIGH:
      set_channel(LED_FL_A, true);
      set_channel(LED_FL_B, true);
      break;

    case THR_STICK_LOW:
      set_channel(LED_FL_A, true);
      set_channel(LED_FL_B, true);
      break;

    case THR_STICK_IDLE:
    default:
      set_channel(LED_FL_A, true);
      set_channel(LED_FL_B, false);
      set_channel(LED_BR_A, true);
      set_channel(LED_BR_B, false);
      on_idle();
      break;
    }
}

void print_values() {
  Serial.print("THR=");
  Serial.print(throttle_percent);
  Serial.print(", STR=");
  Serial.print(steering_angle);
  Serial.println();
}

void loop() {
  on_control();

  if (sync_channels()) {
    // print_values();
  }
  // print_values();
  // flash_emergency();
  // delay(100);
  // print_values();
}
