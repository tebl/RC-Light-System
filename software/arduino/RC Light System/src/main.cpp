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

int thr_value = 0;
int str_value = 0;

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

void setup() {
  pinMode(PIN_LED, OUTPUT);
  Serial.begin(115200);

  pinMode(PIN_THR, INPUT_PULLUP);
  attachInterrupt(digitalPinToInterrupt(PIN_THR), on_changed_thr, CHANGE);

  pinMode(PIN_STR, INPUT_PULLUP);
  attachInterrupt(digitalPinToInterrupt(PIN_STR), on_changed_str, CHANGE);
}

void update_values() {
  if (thr_current_value < 2000) {
    thr_value = thr_current_value;
  }

  if (str_current_value < 2000) {
    str_value = str_current_value;
  }
}

bool values_seen() {
  if (thr_value == 0) return false;
  if (str_value == 0) return false;
  return true;
}

void print_values() {
  Serial.print("THR=");
  Serial.print(thr_value);
  Serial.print(", STR=");
  Serial.print(str_value);
  Serial.println();
}

void loop() {
  update_values();

  if (values_seen()) {
    print_values();
  }
}