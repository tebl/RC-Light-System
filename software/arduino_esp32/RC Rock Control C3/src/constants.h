#pragma once
#define PIN_CH1 20
#define PIN_CH2 10
#define PIN_LED_1 3
#define PIN_LED_2 2
#define PIN_LED_3 1
#define PIN_LED_4 0
#define PIN_CFG 7

#define LED_BUILTIN 8
#define PIN_BOOT 9

#define STATE_INVALID 0
#define STATE_IDLE 1
#define STATE_ACTIVE 2
#define STATE_NEGATIVE 2
#define STATE_POSITIVE 3

#define MODE_DISABLED 0
#define MODE_DYNAMIC 1
#define MODE_INVERTED 2
#define MODE_BREATHING 3
#define MODE_LOW 4
#define MODE_HIGH 5
#define MODE_LAST MODE_HIGH