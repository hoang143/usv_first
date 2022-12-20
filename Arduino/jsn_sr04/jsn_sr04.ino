#define TRIGPIN 12
#define ECHOPIN 4

float temp = 0; 
float duration = 0;
float distance = 0;

void setup() {

  Serial.begin(9600);

  pinMode(ECHOPIN, INPUT);
  pinMode(TRIGPIN, OUTPUT);
}

void loop() {

  digitalWrite(TRIGPIN, LOW);
  delayMicroseconds(10);
  
  digitalWrite(TRIGPIN, HIGH);
  delayMicroseconds(40);
  
  digitalWrite(TRIGPIN, LOW);
  
  temp = pulseIn(ECHOPIN, HIGH);
  if (temp>0) duration = temp;
  
  distance = (duration / 2) * 0.343;
  
  Serial.print("distance: ");
  Serial.print(distance);
  Serial.println(" mm");
  
  delay(50);
}
