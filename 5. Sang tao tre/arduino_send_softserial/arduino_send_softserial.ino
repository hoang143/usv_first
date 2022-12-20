#include <SoftwareSerial.h>

  // Software serial
  const int RXPin = 4;
  const int TXPin = 7;
  const uint32_t arduino_baud = 9600;
  SoftwareSerial ss(RXPin, TXPin);

  // Read serial
  char speed_12[6];
  int speed_read = 286656;

void setup() {
  ss.begin(arduino_baud);
  Serial.begin(9600);
}

void loop() {
String readString;
String Q;

//-------------------------------Check Serial Port---------------------------------------
 
   while (ss.available()){
    delay(1);
    if(ss.available()>0){
    char c = ss.read();
      //Serial.print(c);
     if (isControl(c)){
    break;
      }
     }
   }
  ss.print("28665600 \n");
  //ss.print("\n");
}
