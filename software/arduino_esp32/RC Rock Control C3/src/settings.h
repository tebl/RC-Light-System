#pragma once
/* These values need to be adjusted to the values used by your transmitter and
 * receiver combination. Failiure to do so may cause the lighting system to
 * trigger prematurely or not at all.
 */
#define CH1_PULSE_MIN 1000
#define CH1_PULSE_MAX 2000
#define CH2_PULSE_MIN 1000
#define CH2_PULSE_MAX 2000

#define LED_1_LOW 16
#define LED_1_HIGH 255
#define LED_1_DEFAULT LED_1_LOW
#define LED_2_LOW LED_1_LOW
#define LED_2_HIGH LED_1_HIGH
#define LED_2_DEFAULT LED_2_LOW
#define LED_3_LOW LED_1_LOW
#define LED_3_HIGH LED_1_HIGH
#define LED_3_DEFAULT LED_3_LOW
#define LED_4_LOW LED_1_LOW
#define LED_4_HIGH LED_1_HIGH
#define LED_4_DEFAULT LED_4_LOW

#define LED_STEPS 10
#define BLINKER_SPEED 375
#define BREATHING_SPEED 2000
#define DEFAULT_MODE MODE_INVERTED

/* The hardware can combine two outputs in order to have a difference in
 * brightness, allowing a light to operate in three modes: off/low/high.
 * The code has therefore been implemented with the same modes, but placed
 * at specific thresholds in relation to controller input. This mostly applies
 * to channel2.
 */
#define LOW_THRESHOLD 10
#define HIGH_THRESHOLD 80