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

unsigned long last_blink = 0;
bool blink_cycle = true;
void control_blinkers() {
  switch (last_str_state) {
    case STR_STICK_LEFT:
      if (last_blink == 0) {
        last_blink = millis();
        blink_cycle = true;
      } else {
        if ((millis() - last_blink) >= 500) {
          last_blink = millis();
          blink_cycle = !blink_cycle;
        }
      }
      set_channel(LED_BL_L, blink_cycle);
      set_channel(LED_BL_R, false);
      break;

    case STR_STICK_RIGHT:
      if (last_blink == 0) {
        last_blink = millis();
        blink_cycle = true;
      } else {
        if ((millis() - last_blink) >= 500) {
          last_blink = millis();
          blink_cycle = !blink_cycle;
        }
      }
      set_channel(LED_BL_L, false);
      set_channel(LED_BL_R, blink_cycle);
      break;

    case STR_STICK_IDLE:
      last_blink = 0;
      set_channel(LED_BL_L, false);
      set_channel(LED_BL_R, false);
      break;
  }
}


unsigned long last_active = millis();
unsigned long last_throttle = millis();
unsigned long last_steering = millis();
void on_throttle() {
  last_throttle = millis();
  last_active = last_throttle;
}

void on_steering() {
  last_steering = millis();
  last_active = last_steering;
}

bool is_parked() {
 return ((millis() - last_active) >= PARKED_THRESHOLD);
}

bool is_idle() {
 return ((millis() - last_throttle) >= IDLE_THRESHOLD);
}

void control_leds() {
  last_thr_state = get_thr_state();
  last_str_state = get_str_state();

  switch (last_thr_state) {
    case THR_STICK_REVERSE_LOW:
    case THR_STICK_REVERSE_HIGH:
      on_throttle();
      set_channel(LED_FL_A, true);
      set_channel(LED_FL_B, false);
      set_channel(LED_BR_A, true);
      set_channel(LED_BR_B, true);
      break;

    case THR_STICK_LOW:
    case THR_STICK_HIGH:
      on_throttle();
      set_channel(LED_FL_A, true);
      set_channel(LED_FL_B, true);
      set_channel(LED_BR_A, true);
      set_channel(LED_BR_B, false);
      break;

    case THR_STICK_IDLE:
    default:
      set_channel(LED_FL_A, true);
      set_channel(LED_FL_B, false);
      set_channel(LED_BR_A, true);
      set_channel(LED_BR_B, false);
      break;
  }

  switch (last_str_state) {
    case STR_STICK_LEFT:
    case STR_STICK_RIGHT:
      on_steering();
      break;
  
    default:
      break;
  }

  /* The logic here is that if we've not moved for quite some time, then
   * we've parked and should shut off all lights. The blinkers quickly get
   * annoying when they're going off every time we steer, so we'll only use
   * those if we've come to a stop - we can't actually know that so we just
   * assume that if you've not accelerated for a short period of time.
   * 
   * TODO: Change it so that only transitioning to a HIGH throttle states
   *       disables the blinkers, that way we could blink while going slowly.
   */
  if (is_parked()) {
    set_channel(LED_FL_A, false);
    set_channel(LED_FL_B, false);
    set_channel(LED_BR_A, false);
    set_channel(LED_BR_B, false);
  } else {
    if (is_idle()) {
      control_blinkers();
    } else {
      set_channel(LED_BL_L, false);
      set_channel(LED_BL_R, false);
    }
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
  control_leds();

  if (sync_channels()) {
    // print_values();
  }
}
