#include <OneWire.h>
#include <DallasTemperature.h>
#include <Wire.h>
#include <Ethernet.h>
byte mac[] = { 0xDE, 0xAD, 0xBE, 0xEF, 0xFE, 0xED }; //MAC Address
#define ONE_WIRE_BUS 8 // pin suhu 
int sensorPin = A0; //pin kekeruhan analog output
#define SensorPin 1          // the pH meter Analog output is connected with the Arduino’s Analog
unsigned long int avgValue;  //Store the average value of the sensor feedback
float b = 0;
int buf[10],temp;
#define SensorPin 2          // the salinitas meter Analog output is connected with the Arduino’s Analog
unsigned long int avgValueSAL;  //Store the average value of the sensor feedback
float c = 0;
int bufs[10],temps;
OneWire oneWire(ONE_WIRE_BUS);
DallasTemperature sensors(&oneWire);
float Celsius = 0;
// float Fahrenheit = 0;
float volt;
float ntu = 0;
float phValue;
float salValue;

//standar value sensor
float standarsuhu = 28.5;
float standarph = 8;
float standarkekeruhan = 3.75;
float standarsalinitas = 24;


int period = 5000; //interval simpan data ke db
unsigned long time_now = 0;
unsigned long byteCount = 0;
bool printWebData = true;  // set to false for better speed measurement
char server[] = "192.168.2.2";
IPAddress ip(192,168,1,2); //arduino IP
EthernetClient client; 

void setup() {
  pinMode(12,OUTPUT);
  pinMode(13,OUTPUT);
  sensors.begin();
  Serial.begin(9600);
  Ethernet.begin(mac, ip);
  Serial.print("Local IP : ");
  Serial.println(Ethernet.localIP());
  delay(4000);
}
void loop() {

  //PERHITUNGAN SUHU
  sensors.requestTemperatures();
  Celsius = sensors.getTempCByIndex(0);
//  Fahrenheit = sensors.toFahrenheit(Celsius);
  
   
   
  if(millis() >= time_now + period){
    time_now += period;
    SendtoDB();
  } 
  int len = client.available();
  if (len > 0) {
        byte buffer[80];
        if (len > 80) len = 80;
        client.read(buffer, len);
        if (printWebData) {
          Serial.write(buffer, len); // show in the serial monitor (slows some boards)
        }
        byteCount = byteCount + len;
  } 
  delay(4000);
}

//insert data ke DB via injeksi control.php
void SendtoDB(){
  //PERHITUNGAN TURBIDITY
  int turbidity = analogRead(A0);// read the input on analog pin 0:
  float volt = turbidity*(5.0/ 1024.0)*3; // Convert the analog reading (which goes from 0 - 1023) to a voltage (0 - 5V):
//  tb = volt();
  //Serial.println("Nilai Kekeruhan sekarang:");
  //Serial.print(volt); // print out the value you read:
  //PERHITUNGAN PH
  for(int i=0;i<10;i++)       //Get 10 sample value from the sensor for smooth the value
  { 
    buf[i]=analogRead(SensorPin);
    delay(10);
  }
  for(int i=0;i<9;i++)        //sort the analog from small to large
  {
    for(int j=i+1;j<10;j++)
    {
      if(buf[i]>buf[j])
      {
        temp=buf[i];
        buf[i]=buf[j];
        buf[j]=temp;
      }
    }
  }
  avgValue=0;
  for(int i=2;i<8;i++)                      //take the average value of 6 center sample
    avgValue+=buf[i];
  float phValue=(float)avgValue*5.0/1024/6; //convert the analog into millivolt
  phValue=1.7*phValue;                      //convert the millivolt into pH value
//  Serial.println("Nilai pH sekarang:");  
//  Serial.print(phValue,2);
//  Serial.print(" ");
  digitalWrite(13, HIGH);       
  delay(800);
  digitalWrite(13, LOW);
  
  
  //SALINITAS
  for(int i=0;i<10;i++)       //Get 10 sample value from the sensor for smooth the value
  { 
    bufs[i]=analogRead(SensorPin);
    delay(10);
  }
  for(int i=0;i<9;i++)        //sort the analog from small to large
  {
    for(int j=i+1;j<10;j++)
    {
      if(bufs[i]>bufs[j])
      {
        temps=bufs[i];
        bufs[i]=bufs[j];
        bufs[j]=temp;
      }
    }
  }
  avgValueSAL=0;
  for(int i=2;i<8;i++)                      //take the average value of 6 center sample
    avgValueSAL+=bufs[i];
  float salValue=(float)avgValueSAL*5.0/1024/6; //convert the analog into millivolt
  salValue=1.7*salValue;                      //convert the millivolt into pH value
//  Serial.print("Nilai Salinitas sekarang:");  
//  Serial.print(salValue,2);
//  Serial.println(" ");
  digitalWrite(13, HIGH);       
  delay(800);
  digitalWrite(13, LOW);
   Serial.println(salValue);
   if (client.connect(server, 80)) {
    Serial.println("");
    Serial.println("connected");
    // Make a HTTP request:
    Serial.print("GET /wqs/views/data/control.php?dataSuhu=");
    Serial.print(Celsius);
    Serial.print("&dataStandarsuhu=");
    Serial.print(standarsuhu);
    Serial.print("&dataPh=");
    Serial.print(phValue);
    Serial.print("&dataStandarph=");
    Serial.print(standarph);
    Serial.print("&dataKekeruhan=");
    Serial.print(volt);
    Serial.print("&dataStandarkekeruhan=");
    Serial.print(standarkekeruhan);
    Serial.print("&dataSalinitas=");
    Serial.print(salValue);
    Serial.print("&dataStandarsalinitas=");
    Serial.print(standarsalinitas);
   
    client.print("GET /wqs/views/data/control.php?dataSuhu=");     //YOUR URL
    client.print(Celsius);
    client.print("&dataStandarsuhu=");
    client.print(standarsuhu);
    client.print("&dataPh=");
    client.print(phValue);
    client.print("&dataStandarph=");
    client.print(standarph);   
    client.print("&dataKekeruhan=");
    client.print(volt);
    client.print("&dataStandarkekeruhan=");
    client.print(standarkekeruhan);
    client.print("&dataSalinitas=");
    client.print(salValue);
    client.print("&dataStandarsalinitas=");
    client.print(standarsalinitas);
    
    //client.print(Fahrenheit);
    client.print(" ");      //SPACE BEFORE HTTP/1.1
    client.print("HTTP/1.1");
    client.println();
    client.println("Host: 192.168.2.2");
    client.println("Connection: close");
    client.println();
  } else {
    // if you didn't get a connection to the server:
    Serial.println("connection failed");
  }
 }
