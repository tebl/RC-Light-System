#pragma once
/* These values need to be adjusted to the values used by your transmitter and
 * receiver combination. Failiure to do so may cause the lighting system to
 * trigger prematurely or not at all.
 */
#define THROTTLE_PULSE_MIN 1166
#define THROTTLE_PULSE_MAX 1980
#define THROTTLE_FUDGE 22

/* The hardware can combine two outputs in order to have a difference in
 * brightness, allowing a light to operate in three modes: off/low/high.
 * The code has therefore been implemented with the same modes, but placed
 * at specific thresholds in relation to controller input. This mostly applies
 * to throttle.
 */
#define LOW_THRESHOLD 10
#define HIGH_THRESHOLD 80