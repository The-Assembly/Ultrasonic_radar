import processing.opengl.*;
import toxi.geom.*;
import toxi.processing.*;

ToxiclibsSupport gfx;


void setup() 
{
  size (1280, 720);
  gfx = new ToxiclibsSupport(this);
  smooth();
  
}

void draw() 
{
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
}
