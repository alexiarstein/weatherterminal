#!/bin/bash
# A terminal-based weather report app. Requires 'jq' and 'curl'
# USAGE: weather.sh city country (e.g: weather.sh buenos aires argentina)
# Author: Alexia Michelle Rivera Steinberg <alexiarstein@aol.com>
# License: MIT
# See Licensing for more information
# Docs & Help: https://alexia.lat


API_KEY="YOUR-API-KEY-GOES-HERE"
API_OP="no"  # Set the option for air quality

if [ "$#" -lt 2 ]; then
    echo "Usage: $0 <city> <region>"
    exit 1
fi

City="$1"
Region="$2"

API_URL="http://api.weatherapi.com/v1/current.json?key=$API_KEY&q=$City,$Region&aqi=$API_OP"

response=$(curl -s -X GET "$API_URL" | jq '.')

if [ -n "$(echo "$response" | jq -r '.current')" ]; then
    temp_c=$(echo "$response" | jq -r '.current.temp_c')
    temp_f=$(echo "$response" | jq -r '.current.temp_f')
    feelslike_c=$(echo "$response" | jq -r '.current.feelslike_c')
    feelslike_f=$(echo "$response" | jq -r '.current.feelslike_f')
    cloud=$(echo "$response" | jq -r '.current.cloud')
    humidity=$(echo "$response" | jq -r '.current.humidity')
    wind_kh=$(echo "$response" | jq -r '.current.wind_kph')
    wind_dir=$(echo "$response" | jq -r '.current.wind_dir')

## If you want the output in spanish, uncomment the two commented lines and comment the two in English. 
## Otherwise leave it as it is.

    printf "Weather Report for: %s, %s\n" "$City" "$Region"
#    printf "Clima para: %s, %s\n" "$City" "$Region"
#    printf "Temp Actual: %s°C | ST: %s°C | Nubosidad: %s%% | Humedad: %s%% | Viento: %s km/h, %s\n" \
    printf "Temperature: %s°C | Feels Like: %s°C | Cloud Index: %s%% | Humidity: %s%% | Wind Spd.: %s km/h, %s\n" \
        "$temp_c" "$feelslike_c" "$cloud" "$humidity" "$wind_kh" "$wind_dir"
else
#    echo "Error: Alexia debe haber roto algo"
    echo "Error: Unable to retrieve weather report"
    exit 1
fi

exit 0
