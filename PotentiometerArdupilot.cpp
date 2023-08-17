/* Servo code for Potentiometer */

#include <Servo.h>

Servo Servo1;

int servoPin = 9;
int potPin = A0;

void setup() {
	Servo1.attach(servoPin);
}

void loop(){
	/*Arduino receives voltage to pin A0
	This is converted to a number between 0 and 1023 
	depending on voltage level received */
	int reading = analogRead(potPin);
	
	int angle = map(reading, 0, 1023, 0, 180);
	//Servo needs an input of an angle between 0 - 180
	//line 20 created a conversion scale to map 0 - 1023 to 0 - 180

	Servo1.write(angle);
}
