import processing.serial.*;     // import the Processing serial library
Serial myPort;
char val;

PImage img;
int blue = 255;
int red = 0;
int speed = 5;

void setup() {
  size(395, 295);

  img = loadImage("not.jpg");
  myPort = new Serial(this, "COM5", 9600);
}

void draw() {

  background(red, 0, blue);
  image(img, 20, 20);

  if ( myPort.available() > 0) {
    String buffer = myPort.readStringUntil('\n');

    if (buffer != null) {
      int resp = parseInt(split(buffer, '\n')[0].trim());

      if (resp == 1) {    
        println("Motion detected!");
       img = loadImage("warning.gif");
        blue = 0;
        red = 255;
      } 
      else if (resp == 0) {
        println("Motion ended!");
        img = loadImage("not.jpg");
        
        blue = 255;
        red = 0;
      }
    }
  }
 }

