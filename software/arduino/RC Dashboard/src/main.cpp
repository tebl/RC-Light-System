#include <Arduino.h>
#include <Tiny4kOLED.h>
#include "images.h"
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
  oled.begin(128, 32, sizeof(tiny4koled_init_128x32br), tiny4koled_init_128x32br);

  /* Tiny4kOLED works with two distinct sets of RAM, the one currently shown
   * and the one we're updating before flipping between the two. Therefore we
   * clear both and set the dashboard as a staging point.
   */
  oled.clear();
  oled.bitmap(0, 0, 128, 4, image_dashboard);
  oled.switchRenderFrame();
  oled.clear();
  oled.bitmap(0, 0, 128, 4, image_dashboard);

  oled.on();
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

/* Renders the throttle gauge on the OLED. The function assumes that
 * variables for gauge value as well as gear has been previously updated.
 */
void show_gauge() {
  /* The gauge is always shown in full, but in order to have an inactive
    * portion of it - we'll just blank out those pixels from the screen
    * by sending it black pixels. If a limit has been set, we can set an
    * upper limit for what reverse will be showing.
    */
  blank_start = map(gauge_value, 0, 100, 0, 96 - 1);
  #ifdef LIMIT_REVERSE
    if (current_gear == GEAR_REVERSE) {
      blank_start = map(gauge_value, 0, 100, 0, LIMIT_REVERSE - 1);
    }
  #endif
  num_blanks = 96 - blank_start;

  oled.bitmap(
    8,
    1, 
    8 + 96,
    3,
    #if GAUGE_STYLE == 2
      image_gauge2
    #elif GAUGE_STYLE == 3
      image_gauge3
    #else
      image_gauge1
    #endif
  );

  oled.setCursor(8 + blank_start, 1);
  oled.startData();
  for (int i = 0; i < num_blanks; i++) {
    oled.sendData(0x00);
  }
  oled.endData();

  oled.setCursor(8 + blank_start, 2);
  oled.startData();
  for (int i = 0; i < num_blanks; i++) {
    oled.sendData(0x00);
  }
  oled.endData();
}

void show_gear() {
  /* Set image according to which gear we're in... it's an automatic so it's 
    * Drive, Reverse or Neutral. 
    */
  switch (current_gear) {
    case GEAR_DRIVE:
      oled.bitmap(
        112, 
        1, 
        112 + 15, 
        3, 
        #ifdef GEARS_ALT
          image_gear_alt_drive
        #else
          image_gear_drive
        #endif
      );
      break;
    case GEAR_REVERSE:
      oled.bitmap(
        112, 
        1, 
        112 + 15, 
        3, 
        #ifdef GEARS_ALT
          image_gear_alt_reverse
        #else
          image_gear_reverse
        #endif
      );
      break;
    default:
      oled.bitmap(
        112, 
        1, 
        112 + 15, 
        3, 
        #ifdef GEARS_ALT
          image_gear_alt_neutral
        #else
          image_gear_neutral
        #endif
      );
      break;
      break;
  }
}

void loop() {
  read_throttle();
  if (value_changed) {
    current_gear = get_gear();
    gauge_value = current_value;
    if (gauge_value < 0) gauge_value = -gauge_value;

    show_gauge();
    show_gear();

    oled.switchFrame();
  }
}