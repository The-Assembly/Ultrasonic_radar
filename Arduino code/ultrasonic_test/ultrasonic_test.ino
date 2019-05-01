const int trigPin = 9;
const int echoPin = 8;

long duration; //to measure time
int distinCM; //to measure distance in cm

void setup() 
{
  pinMode(trigPin, OUTPUT); //transmission is output
  pinMode(echoPin, INPUT); //receiver is input
  Serial.begin(9600);
}
void loop() 
{
    digitalWrite(trigPin, LOW); 
    delayMicroseconds(2);
    digitalWrite(trigPin, HIGH); //sending the transmission
    delayMicroseconds(10);
    digitalWrite(trigPin, LOW); //stops the transmission
    duration = pulseIn(echoPin, HIGH); //recieves the transmission, pulseIn turns on echoPin but only for a moment
    distinCM = duration*0.034/2; // Calculates the distance in cm
    
    Serial.println(distinCM);
    delay(50);
  }
