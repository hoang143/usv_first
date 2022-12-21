// -------------------------------CODE for ESP8266 Nodemcu-------------------------------

#include <ESP8266WiFi.h>
#include <WiFiUdp.h>
#include <USVFunction.h>
#include <HCSR04.h>

USVFunction usv;

#define echoPinForward D2//D2
#define echoPinLeft D1 
#define echoPinRight D6 //D6
#define triggerPIN D5 //D6

// Distances to obstacles
float distance_front = 10;
float distance_left = 10;
float distance_right = 10;

float distance_front_log [16];
float distance_left_log [16];
float distance_right_log [16];

float temp_front = 10;
float temp_left = 10;
float temp_right = 10;

int count_idle_front = 0;
int count_idle_left = 0;
int count_idle_right = 0;

// UDP WIFI
  const char* ssid = "MERCURY_2.4G_0122";
  const char* password = "hch4pw7n";
  //const char* ssid = "KTHK 207";
  //const char* password = "hmt123456789xyz";
  // const char* ssid = "Hieu Thao 2,4g";
  // const char* password = "0944012555";
  // const char* ssid = "Linh";
  // const char* password = "sinhnhatcuatao";
  // const char* ssid = "POCO F3";
  // const char* password = "12345789";
  // const char* ssid = "TP-LINK_3D77A0";
  // const char* password = "";
  //const char* ssid = "HUAWEI_ADDD";
  //const char* password = "YG0A94HM7B2";
  //const char* ssid = "TAIH";
  //const char* password = "hmt12345";
  const char* end_char = "; ";
  const char* terminate_char = "~";
  
  WiFiUDP Udp;
  unsigned int localUdpPort = 4210;  // local port to listen on
  char  replyPacket[] = "USV Packet: ";  // a reply string to send back

// TEMP VARIABLES
  double temp;
  int i = 0;
  const float pi = 3.14159265359;

// IP addresses  
  IPAddress laptop(192,168,1,38); 
  IPAddress controller(192,168,1,52);
  IPAddress observer(192,168,1,51);
  IPAddress observer_2(192,168,1,61);

  IPAddress gateway(192, 168, 1, 1);  
  IPAddress subnet(255, 255, 0, 0);
  IPAddress primaryDNS(8, 8, 8, 8);   //optional
  IPAddress secondaryDNS(8, 8, 4, 4); //optional
  
  
//----------------------------------------------------------------------------    SETUP   -----------------------------------------------------------------------------
//-----------------------------------------------------------------------------***-----***----------------------------------------------------------------------------- 
void setup() {

  // Set Pin Mode
  pinMode(echoPinForward,INPUT_PULLUP);
  pinMode(triggerPIN, OUTPUT);
  pinMode(echoPinLeft,INPUT_PULLUP);
  pinMode(echoPinRight,INPUT_PULLUP);

  // Serial
  Serial.begin(9600);

  // Configures static IP address
  if (!WiFi.config(observer_2, gateway, subnet, primaryDNS, secondaryDNS)) {
    Serial.println("STA Failed to configure");
  }
  
  // Connect to Wi-Fi network with SSID and password
  Serial.print("Connecting to ");
  Serial.println(ssid);
  WiFi.begin(ssid, password);
  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  }
  // Print local IP address and start web server
  Serial.println("");
  Serial.println("WiFi connected.");
  Serial.println("IP address: ");
  Serial.println(WiFi.localIP());
  Udp.begin(4210);
}

//-----------------------------------------------------------------------------   LOOP    -----------------------------------------------------------------------------
//-----------------------------------------------------------------------------***-----***-----------------------------------------------------------------------------
void loop(){

  temp_front = readDistanceSensor(echoPinForward);
  temp_left = readDistanceSensor(echoPinLeft);
  temp_right = readDistanceSensor(echoPinRight);

  // READ DISTANCES TO OBSTACLES
  if (temp_front>0) distance_front = temp_front/100;
  if (temp_left>0) distance_left = temp_left/100;
  if (temp_right>0) distance_right = temp_right/100;

  // FILTER FRONT
  distance_front_log[0] = distance_front;
  for (int i=1; i<=15; i++)
  {
    distance_front = distance_front + distance_front_log [i];
    if (distance_front_log [i] == distance_front_log [i-1])
    {
      count_idle_front ++;
    }
    else
    {
      count_idle_front = 0;
    }  
    distance_front_log [i] = distance_front_log [i-1];
  }

  distance_front = distance_front/16;
  if (count_idle_front >= 600)
  {
    count_idle_front = 600;
    distance_front = 10;
  }

  // FILTER LEFT
  distance_left_log[0] = distance_left;
  for (int i=1; i<=15; i++)
  {
    distance_left = distance_left + distance_left_log [i];
    if (distance_left_log [i] == distance_left_log [i-1])
    {
      count_idle_left ++;
    }
    else
    {
      count_idle_left = 0;
    }  
    distance_left_log [i] = distance_left_log [i-1];
  }

  distance_left = distance_left/16;
  if (count_idle_left >= 600)
  {
    count_idle_left = 600;
    distance_left = 10;
  }

  // FILTER RIGHT
  distance_right_log[0] = distance_right;
  for (int i=1; i<=15; i++)
  {
    distance_right = distance_right + distance_right_log [i];
    if (distance_right_log [i] == distance_right_log [i-1])
    {
      count_idle_right ++;
    }
    else
    {
      count_idle_right = 0;
    }  
    distance_right_log [i] = distance_right_log [i-1];
  }

  distance_right = distance_right/16;
  if (count_idle_right >= 600)
  {
    count_idle_right = 600;
    distance_right = 10;
  }

  // DISTANCE LIMITS
  if (distance_front>10) distance_front = 10;
  if (distance_left>10) distance_left = 10;
  if (distance_front>10) distance_right = 10;

  if (distance_front<0) distance_front = 0;
  if (distance_left<0) distance_left = 0;
  if (distance_front<0) distance_right = 0;

  Serial.print("Distance left: ");
  Serial.print(distance_left);
  Serial.print(", Distance right: ");
  Serial.print(distance_right);
  Serial.print(", Distane forward: ");
  Serial.print(distance_front);

  // ------------------------------------------------UDP SEND LOG DATA-------------------------------------------
    
  Udp.beginPacket(controller, 4210);
  //Udp.beginPacket(laptop, 4210);
   
  // Distances
  udp_send(distance_front,2,9);
  udp_send(distance_left,2,9);
  udp_send(distance_right,2,9);

  Udp.write(terminate_char);
  Udp.endPacket();

  //---------- Debug UDP ----------

  Udp.beginPacket(laptop, 6210);

  // Distances
  Udp.write("Front distance: ");
  udp_send(distance_front,2,9);

  Udp.write("Left distance: ");
  udp_send(distance_left,2,9);

  Udp.write("Right distance: ");
  udp_send(distance_right,2,9);

  Udp.write(terminate_char);
  Udp.endPacket();

// ---------------------END LOOP---------------------
  Serial.println();
}

//----------------------------------------------------------------------------- FUNCTIONS ----------------------------------------------------------------------------- 
//-----------------------------------------------------------------------------***-----***----------------------------------------------------------------------------- 

void udp_send (double data, int top_digit, int lowest_decimal)
{
  if (data<0)
  {
    data = abs(data);
    Udp.write(45);
  }
  else Udp.write(43);
  
  int string_size = top_digit + lowest_decimal + 1;
  char udp_string [string_size];
  temp = data;
  
  for (int i = top_digit; i>=1; i--)
  {
   udp_string[top_digit-i] = temp/pow(10,(i-1));
   temp = temp - udp_string[top_digit-i] * pow(10,(i-1));
   udp_string[top_digit-i] = udp_string[top_digit-i] +48;
  }

  udp_string[top_digit] = 46;

  for (int i = 1; i <= lowest_decimal; i++)
  {
   udp_string[top_digit+i] = temp/pow(10,-i);
   temp = temp - udp_string[top_digit+i] * pow(10,-i);
   udp_string[top_digit+i] = udp_string[top_digit+i] +48;
  }

  for (int i=0; i<= (string_size-1); i++)
  {
    Udp.write(udp_string[i]);
  }
   
  Udp.write(end_char);
}

int readDistanceSensor(int echoPIN){
  int distanceCM = 0;                     
  unsigned long durationMS = 0;  
  digitalWrite(triggerPIN, LOW);
  delayMicroseconds(100);
  digitalWrite(triggerPIN, HIGH);
  delayMicroseconds(100);
  digitalWrite (triggerPIN,LOW);     
  durationMS = pulseIn(echoPIN, HIGH, 30000);
  
  return distanceCM = ((durationMS * 0.034) / 2);
}
