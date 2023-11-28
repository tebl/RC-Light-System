#pragma once
/* These values need to be adjusted to the values used by your transmitter and
 * receiver combination. Failiure to do so may cause the lighting system to
 * trigger prematurely or not at all.
 */
#define THROTTLE_PULSE_MIN 1136
#define THROTTLE_PULSE_MAX 1956
#define STEERING_PULSE_MIN 1124
#define STEERING_PULSE_MAX 1944

/* The blinkers quickly get annoying, so they're only used when we can assume
 * that the car has come to a complete stop. In other words something that can
 * be assumed to be subjective at best.
 * 
 * Parked threshold is a timer that starts when the car is not under throttle,
 * AND we're not steering. After this threshold the lights will be shut off as
 * we've "parked" the car.
 */
#define IDLE_THRESHOLD 1000
#define PARKED_THRESHOLD 20000

/* The hardware can combine two outputs in order to have a difference in
 * brightness, allowing a light to operate in three modes: off/low/high.
 * The code has therefore been implemented with the same modes, but placed
 * at specific thresholds in relation to controller input. This mostly applies
 * to throttle.
 */
#define LOW_THRESHOLD 10
#define HIGH_THRESHOLD 80

/*
 * The blinker assumes that each pair of LEDs will be lit independently, as we
 * have a distinct left and right side of the car. The electronics has some
 * jitter, so there's a deadzone so that we don't have blinkers randomly going
 * on/off (we simply don't have that kind of accuracy available). If you only
 * want to activate the blinker at a hard left/right, increase the percentage
 * to something you prefer.
 * 
 * Blinker period is how long the LED will be on and then off, meaning that a
 * complete cycle is double of the specific value. While the speed probably
 * varies depending on the make/model of the car, a reasonable range is
 * probably between 250 (2 flashes per second) and 500 (1 flash per second). 
*/
#define BLINKER_DEADZONE 10
#define BLINKER_PERIOD 375