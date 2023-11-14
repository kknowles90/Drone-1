#include <Wire.h>
#include <Servo.h>
#include <MPU6050.h>

MPU6050 mpu6050(Wire);
Servo aileronServo; // Servo for the ailerons
Servo elevatorServo; // Servo for the elevator

void setup() {
    Wire.begin();
    Serial.begin(9600);

    mpu6050.begin();
    mpu6050.calcGyroOffsets(true);

    aileronServo.attach(9); // Attach the aileron servo to pin 9
    elevatorServo.attach(10); // Attach the elevator servo to pin 10
}

void loop() {
    mpu6050.update();

    float roll = mpu6050.getAngleX();
    float pitch = mpu6050.getAngleY();

    // Basic control logic (This will need to be more sophisticated for a real system)
    int aileronPosition = map(roll, -90, 90, 0, 180);
    int elevatorPosition = map(pitch, -90, 90, 0, 180);

    aileronServo.write(aileronPosition);
    elevatorServo.write(elevatorPosition);

    delay(10);
}

int map(int x, int in_min, int in_max, int out_min, int out_max) {
    return (x - in_min) * (out_max - out_min) / (in_max - in_min) + out_min;
}
