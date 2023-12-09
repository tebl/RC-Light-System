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

long gauge_value;

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

void read_throttle() {
  current_value = map_input();
  value_changed = (current_value != last_value);
  last_value = current_value;
}

void setup() {
  pinMode(PIN_RGB_R, OUTPUT);
  pinMode(PIN_RGB_G, OUTPUT);
  pinMode(PIN_RGB_B, OUTPUT);
  pinMode(PIN_THR, INPUT);
}

byte get_gear() {
  if (current_value > LOW_THRESHOLD) return GEAR_DRIVE;
  if (current_value < -(LOW_THRESHOLD)) return GEAR_REVERSE;
  return GEAR_NEUTRAL;
}

uint8_t rgb_value = 0;
void loop() {
  read_throttle();
  if (value_changed) {
    current_gear = get_gear();
    gauge_value = current_value;
    if (gauge_value < 0) gauge_value = -gauge_value;

    rgb_value = 255 - map(gauge_value, 0, 100, 0, 255);

    switch (get_gear()) {
    case GEAR_REVERSE:
      analogWrite(PIN_RGB_R, 255);
      analogWrite(PIN_RGB_G, rgb_value);
      analogWrite(PIN_RGB_B, 255);
      break;

    case GEAR_DRIVE:
      analogWrite(PIN_RGB_R, rgb_value);
      analogWrite(PIN_RGB_G, 255);
      analogWrite(PIN_RGB_B, 255);
      break;
    
    default:
      analogWrite(PIN_RGB_R, 255);
      analogWrite(PIN_RGB_G, 255);
      analogWrite(PIN_RGB_B, 255);
      break;
    }

    // analogWrite(PIN_RGB_R, pgm_read_byte(&gamma_values[rgb_value]));
  }
}