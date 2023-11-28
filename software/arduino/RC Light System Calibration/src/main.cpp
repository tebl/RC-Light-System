#include <Arduino.h>
#include <ServoInput.h>
#include "constants.h"
#include "settings.h"

const int ThrottleSignalPin = PIN_THR;
ServoInputPin<ThrottleSignalPin> throttle(THROTTLE_PULSE_MIN, THROTTLE_PULSE_MAX);

const int SteeringSignalPin = PIN_STR;
ServoInputPin<SteeringSignalPin> steering(STEERING_PULSE_MIN, STEERING_PULSE_MAX);

bool initialized = false;
bool led_cycle = false;
bool observed_changes = false;
int last_throttle = 0;
int throttle_min = -1;
int throttle_max = -1;
int last_steering = 0;
int steering_min = -1;
int steering_max = -1;


void setup() {
  pinMode(PIN_LED, OUTPUT);
  Serial.begin(115200);

  while (!Serial) {
    digitalWrite(PIN_LED, led_cycle ? HIGH : LOW);
    led_cycle = !led_cycle;
		delay(100);
  }
  led_cycle = false;

  while (!ServoInput.available()) {
    digitalWrite(PIN_LED, led_cycle ? HIGH : LOW);
    led_cycle = !led_cycle;
		delay(200);
	}
  led_cycle = false;

  digitalWrite(PIN_LED, LOW);
}

void print_padded(int number) {
  if (number < 1000) Serial.print(' ');
  if (number < 100) Serial.print(' ');
  if (number < 10) Serial.print(' ');
  Serial.print(number);
}

void print_values() {
  Serial.print("[THR: MIN=");
  print_padded(throttle_min);
  Serial.print(", MAX=");
  print_padded(throttle_max);
  Serial.print("] ");

  Serial.print("[STR: MIN=");
  print_padded(steering_min);
  Serial.print(", MAX=");
  print_padded(steering_max);
  Serial.print("]");
  Serial.println();
}

void read_values() {
  observed_changes = false;

  last_throttle = throttle.getPulseRaw(); 
  if (throttle_min == -1 || last_throttle < throttle_min) {
    throttle_min = last_throttle;
    observed_changes = true;
  }
  if (throttle_max == -1 || last_throttle > throttle_max) {
    throttle_max = last_throttle;
    observed_changes = true;
  }

  last_steering = steering.getPulseRaw();
  if (steering_min == -1 || last_steering < steering_min) {
    steering_min = last_steering;
    observed_changes = true;
  }
  if (steering_max == -1 || last_steering > steering_max) {
    steering_max = last_steering;
    observed_changes = true;
  }

  if (observed_changes) {
    print_values();
  }
}

void loop() {
  if (!initialized) {
    Serial.println("------------------------- RC Light System Calibration -------------------------");
    Serial.println();
    Serial.println("  Calibration is performed by registering the MIN/MAX values seen by the");
    Serial.println("  Arduino. Please move the throttle and steering to both extremes, the final ");
    Serial.println("  value to use will be the last one logged.");
    Serial.println();
    for (int i = 10; i > 0; i--) {
      Serial.print('.');
      delay(500);
    }
    Serial.println(" Go!");
    Serial.println();
    initialized = true;
  } else {
    read_values();
  }
}
