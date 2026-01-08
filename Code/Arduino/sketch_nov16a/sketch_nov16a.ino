#include <dht11.h>
dht11 DHT11;
int dht11_output;
int sensor_135;
int sensor_2;
int sensor_4;
int sensor_5;
int sensor_7;
#define DHT11PIN 4
#define MQ135 A1
#define MQ2 A2
#define MQ4 A3
#define MQ5 A4
#define MQ7 A5
unsigned long startTime;
const unsigned long runDuration = 10 * 60 * 1000;
void  setup(){ 
delay(1000);
Serial.begin(9600);  
// Serial.print("Ticks,MQ2,MQ4,MQ5,MQ7,MQ135"); 
// Serial.println();                             
 }
void loop(){
// dht11_output = DHT11.read(DHT11PIN);
sensor_135 = analogRead(MQ135);   
sensor_2 = analogRead(MQ2);    
sensor_4 = analogRead(MQ4);    
sensor_5 = analogRead(MQ5);    
sensor_7 = analogRead(MQ7); 
// Serial.print((float) DHT11.temperature,   2);  
// Serial.print(',');
// Serial.print((float) DHT11.humidity,   2);   
Serial.print(sensor_2,   DEC); 
Serial.print(',');
Serial.print(sensor_4,   DEC); 
Serial.print(',');
Serial.print(sensor_5,   DEC); 
Serial.print(',');
Serial.print(sensor_7,   DEC); 
Serial.print(',');
Serial.print(sensor_135,   DEC); 
Serial.println();  
delay(100);  
}                             