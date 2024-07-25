#pragma once
/* These values need to be adjusted to the values used by your transmitter and
 * receiver combination. Failiure to do so may cause the lighting system to
 * trigger prematurely or not at all.
 */
#define THROTTLE_PULSE_MIN 1166
#define THROTTLE_PULSE_MAX 1980

/* The hardware can combine two outputs in order to have a difference in
 * brightness, allowing a light to operate in three modes: off/low/high.
 * The code has therefore been implemented with the same modes, but placed
 * at specific thresholds in relation to controller input. This mostly applies
 * to throttle.
 */
#define LOW_THRESHOLD 10
#define HIGH_THRESHOLD 80

/* Defines the style used for the gauge, mainly it just determines the image
 * used for the full throttle bar.
 * These can be described as following:
 *  1 - Digital vertical bars
 *  2 - Same as above except filled in
 *  3 - High contrast that fills all the space below the bar.
 *
 * LIMIT_REVERSE is a value (in pixels) for how much of the gauge will be
 * used in reverse, mainly because we would normally want to set the ESC
 * to drive the motor to a lesser degree while in reverse. Comment out the
 * setting in order to disable this feature.
 */
#define GAUGE_STYLE 1
#define GEARS_MANUAL
// #define GEARS_ALT
#define LIMIT_REVERSE 63

#define BOOT_DURATION 3000