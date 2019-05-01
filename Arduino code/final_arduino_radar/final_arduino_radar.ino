#include <Servo.h>

const int trigPin = 9; //pin 9 of arduino
const int echoPin = 8; //pin 8 of arduino

long duration;
int distinCM;

Servo radarServo; //declaration of object to control servo motor

void setup() 
{
  pinMode(trigPin, OUTPUT); //sets trigPin as transmitter
  pinMode(echoPin, INPUT);  //sets echoPin as receiver
  Serial.begin(9600);
  radarServo.attach(11); //connects servo motor to arduino pin 11
}
void loop() 
{
  for(int i=0;i<=180;i++) //loop which goes 180 degree
  {
    radarServo.write(i); //angle of servo motor increases
    delay(50);
    
    digitalWrite(trigPin, LOW); //stops transmission
    delayMicroseconds(2);
    digitalWrite(trigPin, HIGH); //begins transmission
    delayMicroseconds(10);
    digitalWrite(trigPin, LOW); //stops transmission
    duration = pulseIn(echoPin, HIGH); //turns on receiver for a moment
    distinCM = duration*0.034/2; //converts the value to cm
    
    Serial.print(i);
    Serial.print("*"); //printing these symboles so that processing ide can recognise
    Serial.print(distinCM);
    Serial.print("#");
  }
  
  for(int i=180;i>=0;i--) //servo moves in opposite direction with same method
  {
    radarServo.write(i);
    delay(50);
    digitalWrite(trigPin, LOW); 
    delayMicroseconds(2);
    digitalWrite(trigPin, HIGH); 
    delayMicroseconds(10);
    digitalWrite(trigPin, LOW);
    duration = pulseIn(echoPin, HIGH);
    distinCM = duration*0.034/2;
    Serial.print(i);
    Serial.print("*");
    Serial.print(distinCM);
    Serial.print("#");
  }
}
