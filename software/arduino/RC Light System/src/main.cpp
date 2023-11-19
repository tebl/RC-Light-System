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

volatile long thr_start = 0;
volatile long thr_current_time = 0;
volatile long thr_current_value = 0;
int thr_value = 0;

void on_changed_thr() {
  thr_current_time = micros();
  if (thr_current_time > thr_start) {
    thr_current_value = thr_current_time - thr_start;
    thr_start = thr_current_time;
  }
}

bool update_thr() {
  if (thr_current_value < 2000) {
    thr_value = thr_current_value;
    return true;
  }
  return false;
}

void setup() {
  pinMode(PIN_LED, OUTPUT);
  Serial.begin(9600);

  pinMode(PIN_THR, INPUT_PULLUP);
  attachInterrupt(digitalPinToInterrupt(PIN_THR), on_changed_thr, CHANGE);

}

void loop() {
  if (update_thr()) {
    digitalWrite(PIN_LED, HIGH);
    Serial.print("THR = ");
    Serial.println(thr_value);
  } else {
    digitalWrite(PIN_LED, LOW);
  }
}