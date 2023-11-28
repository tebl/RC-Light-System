#pragma once

#define PIN_THR 2
#define PIN_STR 3
#define SER_LATCH 4
#define SER_CLK_2 5
#define SER_CLK_1 7
#define SER_DATA 8
#define PIN_LED 17
#define PIN_AUX 18
#define PIN_VOL 21

/* These values need to be adjusted to the values used by your transmitter and
 * receiver combination. This is just starting points, the real values to use
 * with the lighting system will be output on the serial console.
 */
#define THROTTLE_PULSE_MIN 0
#define THROTTLE_PULSE_MAX 2500
#define STEERING_PULSE_MIN 0
#define STEERING_PULSE_MAX 2500
