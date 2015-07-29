import processing.serial.*;
Serial myPort;
String val;
String fileName;

void setup(){
  String portName = Serial.list()[0];
  myPort = new Serial(this, portName, 57600);
}

void draw(){
  if (myPort.available() > 0){
    val = myPort.readStringUntil('\n');
    println(val);
  }  
}
