#include <Arduino.h>

#define PIN_THR 2
#define PIN_STR 3
#define SER_LATCH 4
#define SER_CLK_2 5
#define SER_CLK_1 7
#define SER_DATA 8
#define PIN_LED 17
#define PIN_AUX 18
#define PIN_VOL 21

#define LED_FL_A 0
#define LED_FL_B 1
#define LED_BR_A 2
#define LED_BR_B 3
#define LED_BL_L 4
#define LED_BL_R 5
#define LED_EX_A 6
#define LED_EX_B 7

uint8_t led_state = 0x00;

long thr_value = 0;
long str_value = 0;
long tmp_value = 0;

volatile long thr_start = 0;
volatile long thr_current_time = 0;
volatile long thr_current_value = 0;
void on_changed_thr() {
  thr_current_time = micros();
  if (thr_current_time > thr_start) {
    thr_current_value = thr_current_time - thr_start;
    thr_start = thr_current_time;
  }
}

volatile long str_start = 0;
volatile long str_current_time = 0;
volatile long str_current_value = 0;
void on_changed_str() {
  str_current_time = micros();
  if (str_current_time > str_start) {
    str_current_value = str_current_time - str_start;
    str_start = str_current_time;
  }
}

void print_values() {
  Serial.print("THR=");
  Serial.print(thr_value);
  Serial.print(", STR=");
  Serial.print(str_value);
  Serial.println();
}

bool channels_dirty = false;
void write_channels() {
  digitalWrite(SER_LATCH, LOW);
  shiftOut(SER_DATA, SER_CLK_1, MSBFIRST, led_state);
  digitalWrite(SER_LATCH, HIGH);
  channels_dirty = false;
}

void sync_channels() {
  if (channels_dirty) {
    // print_values();
    write_channels();
  }
}

void clear_channels() {
  led_state = 0x00;
  write_channels();
}

void set_channel(uint8_t number, bool value = true) {
  uint8_t old_state = led_state;
  if (value) bitSet(led_state, number);
  else bitClear(led_state, number);
  if (old_state == led_state) {
    channels_dirty = true;
  }
}


void setup() {
  pinMode(PIN_LED, OUTPUT);
  Serial.begin(115200);

  pinMode(SER_DATA, OUTPUT);
  pinMode(SER_LATCH, OUTPUT);
  pinMode(SER_CLK_1, OUTPUT);
  pinMode(SER_CLK_2, OUTPUT);
  clear_channels();

  pinMode(PIN_THR, INPUT_PULLUP);
  attachInterrupt(digitalPinToInterrupt(PIN_THR), on_changed_thr, CHANGE);

  pinMode(PIN_STR, INPUT_PULLUP);
  attachInterrupt(digitalPinToInterrupt(PIN_STR), on_changed_str, CHANGE);
}

void update_values() {
  tmp_value = thr_current_value;
  if (tmp_value < 2000) {
    thr_value = tmp_value;
  }

  tmp_value = str_current_value;
  if (tmp_value < 2000) {
    str_value = tmp_value;
  }
}

bool values_seen() {
  if (thr_value == 0) return false;
  if (str_value == 0) return false;
  return true;
}

#define THR_STICK_REVERSE_HIGH -2
#define THR_STICK_REVERSE_LOW -1
#define THR_STICK_IDLE 0
#define THR_STICK_LOW 1
#define THR_STICK_HIGH 2

int get_thr_state() {
  if (thr_value > 1800) return THR_STICK_HIGH;
  if (thr_value > 1600) return THR_STICK_LOW;
  if (thr_value < 1250) return THR_STICK_REVERSE_HIGH;
  if (thr_value < 1450) return THR_STICK_REVERSE_LOW;
  return THR_STICK_IDLE;
}

int last_thr_state = THR_STICK_IDLE;
unsigned long last_thr_event = 0;
int get_debounced_thr_state() {
  int new_state = get_thr_state();

  if (last_thr_state != new_state) {
    long duration = millis() - last_thr_event;
    if ((duration) > 250) {
      last_thr_state = new_state;
      last_thr_event = millis();

      Serial.print("THR set to ");
      Serial.print(last_thr_state);
      Serial.print(" ");
      Serial.println(duration);
    }
  }
  return last_thr_state;
}

#define STR_STICK_LEFT -1
#define STR_STICK_IDLE 0
#define STR_STICK_RIGHT 1
int get_str_state() {
  if (str_value > 1640) return STR_STICK_RIGHT;
  if (str_value < 1450) return STR_STICK_LEFT;
  return STR_STICK_IDLE;
}

void on_idle() {
  switch (get_str_state()) {
    case STR_STICK_LEFT:
      set_channel(LED_BL_L, true);
      set_channel(LED_BL_R, false);
      break;

    case STR_STICK_RIGHT:
      set_channel(LED_BL_L, false);
      set_channel(LED_BL_R, true);
      break;

    default:
    case STR_STICK_IDLE:
      set_channel(LED_BL_L, false);
      set_channel(LED_BL_R, false);
      break;
  }
}

void on_control() {
  switch (get_debounced_thr_state()) {
    case THR_STICK_REVERSE_HIGH:
      set_channel(LED_FL_A, false);
      set_channel(LED_FL_B, false);
      set_channel(LED_BR_A, true);
      set_channel(LED_BR_B, true);
      break;

    case THR_STICK_REVERSE_LOW:
      set_channel(LED_FL_A, false);
      set_channel(LED_FL_B, false);
      set_channel(LED_BR_A, true);
      set_channel(LED_BR_B, false);
      break;

    case THR_STICK_HIGH:
      set_channel(LED_FL_A, true);
      set_channel(LED_FL_B, true);
      set_channel(LED_BR_A, false);
      set_channel(LED_BR_B, false);
      break;

    case THR_STICK_LOW:
      set_channel(LED_FL_A, true);
      set_channel(LED_FL_B, false);
      set_channel(LED_BR_A, false);
      set_channel(LED_BR_B, false);
      break;

    case THR_STICK_IDLE:
    default:
      set_channel(LED_FL_A, false);
      set_channel(LED_FL_B, false);
      set_channel(LED_BR_A, false);
      set_channel(LED_BR_B, false);
      on_idle();
      break;
    }
}

void loop() {
  update_values();

  if (values_seen()) {
    on_control();
    sync_channels();
  }
}