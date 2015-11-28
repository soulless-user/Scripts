!#/bin/bash

# console weather report by Jesse Carleton
# set a cron to pull weather xml file at whatever interval you want, ideally hourly
# cron = "wget -O /usr/scripts/weather.xml 'http://api.openweathermap.org/data/2.5/weather?id=5128581&units=metric&appid=2de143494c0b295cca9337e1e96b00e0&mode=xml'"
# the string "id" in the URL is a numeric code for the city you want weather for, this one is for NYC. refer to openweathermap for your city code.
# set alias in bashrc to call the script easily
# alias weather='/usr/scripts/./weather.sh'
# uses echo, can be swapped with printf


#!/bin/bash
# declare stuff
CITY=$(cat /usr/scripts/weather.xml | cut -d'"' -f4)
TIMEUP=$(cat /usr/scripts/weather.xml | cut -d'"' -f52)
TEMP=$(cat /usr/scripts/weather.xml | cut -d'"' -f14)
COND=$(cat /usr/scripts/weather.xml | cut -d'"' -f48)
WIND=$(cat /usr/scripts/weather.xml | cut -d'"' -f32)
WVAL=$(cat /usr/scripts/weather.xml | cut -d'"' -f30)
WDIR=$(cat /usr/scripts/weather.xml | cut -d'"' -f36)
HI=$(cat /usr/scripts/weather.xml | cut -d'"' -f18)
LO=$(cat /usr/scripts/weather.xml | cut -d'"' -f16)
HUMID=$(cat /usr/scripts/weather.xml | cut -d'"' -f22)
PRES=$(cat /usr/scripts/weather.xml | cut -d'"' -f26)

# print stuff
echo "Weather for $CITY"
echo ""
echo "Temperature: $TEMP Celsius"
echo "High of $HI // Low of $LO"
echo "Conditions: $COND"
echo "Winds Are $WIND at $WVAL KM/h $WDIR"
echo ""
echo "Humidity @ $HUMID %"
echo "Pressure @ $PRES hPa"
echo ""
echo "Updated at: $TIMEUP"