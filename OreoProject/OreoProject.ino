#include <LiquidCrystal.h>

#define RS 4
#define EP 6
#define D4 10
#define D5 11
#define D6 12
#define D7 13

LiquidCrystal lcd(RS, EP, D4, D5, D6, D7);
int screenTimeReference = 0;
int hertz = 5;

void setup(){
  lcd.begin(16,2);
  lcd.print("Booting up");
  Serial.begin(57600);
  //Serial.println("Ready");
  screenTimeReference = millis();
}

void loop() {
  lcd.clear();
  lcd.setCursor(0,1);
  lcd.print(millis()/1000);
  //if (millis() - screenTimeReference > 1000/hertz){
    Serial.println(millis());
    screenTimeReference = millis();
  //}
}
