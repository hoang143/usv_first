#include <SoftwareSerial.h>
#include <Servo.h>

  //Motot pin
  const int pin_motor_1 = 5;
  const int pin_motor_2 = 6;
  Servo f_1;
  Servo f_2;

  // Software serial
  const int RXPin = 4;
  const int TXPin = 7;
  const uint32_t arduino_baud = 9600;
  SoftwareSerial ss(RXPin, TXPin);

  // Read serial
  String Q = "";
  char a[]="00000000";
  int i = 0;
  int speed_12=0;
  int speed_1=0;
  int speed_2=0;

void setup() {
  ss.begin(arduino_baud);
  Serial.begin(9600);
  //pinMode(pin_motor_1, OUTPUT);         
  //pinMode(pin_motor_2, OUTPUT);
  f_1.attach(pin_motor_1,1000,2000);    
  f_2.attach(pin_motor_2,1000,2000);
}
  
void loop() {
  char c = "";
  String readString="";
  
  //-------------------------------Check Serial Port---------------------------------------
  while (1) 
  {  
    if (ss.available() >0) 
    {
      c = ss.read();  //gets one byte from serial buffer
      if (isControl(c)) 
      {
        //Serial.println("it's a control character");
        //i = 0;
        break;
      }
      //if (i>=8)
      //{
      //  i = 0;
      //  break;
      //}
      //strcpy(a[i],c);
      //i++;
      readString += c; //makes the string readString    
    }
  }   
  Q = readString;
  
  Serial.print(Q);
  Serial.print("; ");
  //Serial.print(a);
  //Serial.print("; ");

  //speed_12 = int(a);
  //speed_1 = speed_12/100000-100;
  //speed_2 = (speed_12%100000)/100-100;
  speed_1 = (int(Q.charAt(0))*100) + (int(Q.charAt(1))*10) + int(Q.charAt(2)) - 5430;
  speed_2 = (int(Q.charAt(3))*100) + (int(Q.charAt(4))*10) + int(Q.charAt(5)) - 5430;
  if (speed_1<0) speed_1 = 0;
  if (speed_2<0) speed_2 = 0;
  if (speed_1>230) speed_1 = 230;
  if (speed_2>230) speed_2 = 230;

  Serial.print("Motor: ");
  Serial.print(speed_1);
  Serial.print("; ");
  Serial.print(speed_2);
  Serial.print("; ");

  f_1.write(speed_1);
  f_2.write(speed_2);
  delay(10);
  
  Serial.println();
}
