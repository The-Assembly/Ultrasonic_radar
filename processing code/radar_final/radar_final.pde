import processing.serial.*; //library to get information from arduino com port
import processing.opengl.*; //library for 2D and 3D interface
import toxi.geom.*;  //toxilib is for computation and design
import toxi.processing.*;

ToxiclibsSupport gfx;

//declaration of serial port, distance and all other values necessary for system

Serial port;
String serialAngle;
String serialDistance;
String serialData;
float objectDistance;
int radarAngle, radarDistance;
int index=0;

void setup() 
{
  size (1280, 720); //defines the size of application
  gfx = new ToxiclibsSupport(this);
  smooth(); //removes the edges from all lines
  
  String portName = "COM8"; //put the COM Port which your arduino is connected to
  port = new Serial(this, portName, 9600);
  
  port.bufferUntil('#');
}

void draw() 
{
  //defines the dimensions and size of interface
  noStroke();
  
  fill(0,4); 
  rect(0, 0, 1280, 720);
  fill(10,255,10);
  
  //Radar Arcs and Lines
  pushMatrix();
  
  translate(640,666);
  noFill();
  strokeWeight(2);
  stroke(10,255,10);  
  arc(0,0,1200,1200,PI,TWO_PI);
  arc(0,0,934,934,PI,TWO_PI);
  arc(0,0,666,666,PI,TWO_PI);
  arc(0,0,400,400,PI,TWO_PI);
  strokeWeight(4);
  line(-640,0,640,0);
  line(0,0,-554,-320);
  line(0,0,-320,-554);
  line(0,0,0,-640);
  line(0,0,320,-554);
  line(0,0,554,-320);
  
  popMatrix();
 
  //Ultrasonic Lines
  pushMatrix();
  
  strokeWeight(5);
  stroke(10,255,10);
  translate(640,666);
  line(0,0,640*cos(radians(radarAngle)),-640*sin(radians(radarAngle)));
  
  popMatrix();

  //Object Detection Lines
  pushMatrix();
  
  translate(640,666);
  strokeWeight(5);
  stroke(255,10,10); // red color
  objectDistance = radarDistance*15;

  if(radarDistance<40) //distance setpoint where line starts to turn red
  {
    line(objectDistance*cos(radians(radarAngle)),
    -objectDistance*sin(radians(radarAngle)),
    633*cos(radians(radarAngle)),
    -633*sin(radians(radarAngle)));
  }
  
  popMatrix();
}

//function to receives data from arduino com port and store it in variable

void serialEvent (Serial port) 
{
  serialData = port.readStringUntil('#');
  serialData = serialData.substring(0,serialData.length()-1);
  
  index = serialData.indexOf("*");
  
  serialAngle= serialData.substring(0, index);
  serialDistance= serialData.substring(index+1, serialData.length());
  
  radarAngle = int(serialAngle);
  radarDistance = int(serialDistance);*/
}
