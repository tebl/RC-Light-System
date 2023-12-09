#pragma once

#define PIN_THR 2
#define PIN_INT0 0  // INT0 is physically on PB2, so the same as above.
#define PIN_RGB_R 0
#define PIN_RGB_G 1
#define PIN_RGB_B 4

#define GEAR_NEUTRAL 0
#define GEAR_DRIVE 1
#define GEAR_REVERSE 2
#define GEAR_PARKED 3

/* PWM with gamma correction, the usage of which were taken from an interesting
   article on https://www.arduinoslovakia.eu/blog/2018/8/attiny85---pwm?lang=en
   The effect is that smaller gradual changes are applied throughout the
   spectrum of in PWV values instead of appearing to be exponential with a peak
   quite a while before the actual maximum.

   As the article states, this was generated for values of i from 0 to 255 ->
     x=round( pow( 2.0, i/32.0) - 1);
*/
const byte gamma_values[] PROGMEM = {
  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,
  0,   0,   0,   1,   1,   1,   1,   1,   1,   1,   1,   1,   1,   1,   1,   1,
  1,   1,   1,   1,   1,   1,   1,   1,   1,   1,   1,   2,   2,   2,   2,   2,
  2,   2,   2,   2,   2,   2,   2,   2,   2,   2,   3,   3,   3,   3,   3,   3,
  3,   3,   3,   3,   3,   3,   4,   4,   4,   4,   4,   4,   4,   4,   4,   5,
  5,   5,   5,   5,   5,   5,   5,   6,   6,   6,   6,   6,   6,   6,   7,   7,
  7,   7,   7,   8,   8,   8,   8,   8,   9,   9,   9,   9,   9,  10,  10,  10,
 10,  11,  11,  11,  11,  12,  12,  12,  12,  13,  13,  13,  14,  14,  14,  15,
 15,  15,  16,  16,  16,  17,  17,  18,  18,  18,  19,  19,  20,  20,  21,  21,
 22,  22,  23,  23,  24,  24,  25,  25,  26,  26,  27,  28,  28,  29,  30,  30,
 31,  32,  32,  33,  34,  35,  35,  36,  37,  38,  39,  40,  40,  41,  42,  43,
 44,  45,  46,  47,  48,  49,  51,  52,  53,  54,  55,  56,  58,  59,  60,  62,
 63,  64,  66,  67,  69,  70,  72,  73,  75,  77,  78,  80,  82,  84,  86,  88,
 90,  91,  94,  96,  98, 100, 102, 104, 107, 109, 111, 114, 116, 119, 122, 124,
127, 130, 133, 136, 139, 142, 145, 148, 151, 155, 158, 161, 165, 169, 172, 176,
180, 184, 188, 192, 196, 201, 205, 210, 214, 219, 224, 229, 234, 239, 244, 250
};

const byte colour_values[] PROGMEM = {
  /*
  This might not be anything usable, but it is the colours found on steel
  at different forge temperatures from low to extreme.

  #FFFFE1 Feint straw
  #F9FACE Very feint yellow
  #F7F4AD Light yellow
  #EDDA74 Pale straw yellow
  #BB8559 Golden yellow
  #804040 Dark yellow brown
  #800000 Brown yellow
  #81007F Brown purple
  #660066 Dark purple
  #15307D Full blue
  #000050 Dark blue
  #151B8D Very dark blue
  #4F5E99 Greyish blue
  #4F4F4F Dark grey


  #74605F Black red
  #9C5245 Brown red
  #B43019 Blood red
  #BF3020 Dark cherry red
  #C81A0F Medium cherry red
  #FE0000 Full cherry red
  #F46018 Bright orange red
  #FF7F00 Light red
  #FB6004 Orange
  #F3A247 Orange yellow
  #E0B506 Dark yellow
  #E0E100 Bright yellow
  #FEF37F Light yellow
  #FFFEBB White

  Realistically though, probably something like this:
  https://www.youtube.com/watch?v=kLE9IEz1Hhg

  Glowing from off, to black red and then all the way to a light yellow/white.

  Backfires going to a a 30/70% alernating between blue and white when coming
  off the gas for 3-400ms. On throttle we also add in a bit of combination
  to get a little purple.
  */
};