#define echoPinForward D2   //D2
#define echoPinLeft D1 
#define echoPinRight D6     //D6
                         
//****************** SETUP **********************
void setup()
{
  pinMode(echoPinForward,INPUT);
  pinMode(echoPinLeft,INPUT);
  pinMode(echoPinRight,INPUT);
  Serial.begin(115200);
 }

//******************* LOOP **********************
void loop()
{
  Serial.print("distance left: ");
  Serial.print(readDistanceSensor(echoPinLeft));
  Serial.print(", distance right: ");
  Serial.print(readDistanceSensor(echoPinRight));
  Serial.print(", distane forward:");
  Serial.print( readDistanceSensor(echoPinForward));
  Serial.println("");
}
  
int readDistanceSensor(int echoPIN){
  int distanceCM = 0;                     
  unsigned long durationMS = 0;           
  durationMS = pulseIn(echoPIN, HIGH);
  if (durationMS == 0)
  return 0;
  else {
  return distanceCM = ((durationMS * 0.034) / 2);
  }
}
