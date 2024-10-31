#!/bin/bash

# Function to generate a CLF formatted timestamp
generate_timestamp() {
  date "+%Y-%m-%d %H:%M:%S"
}

# Function to generate a random record line
generate_request_line() {
  local records=("William,Clark,123:New York,United States" "John,Davis,10115:Berlin,Germany" "Thomas,Wilson,80333:Munich,Germany" "David,Williams,20345:Glasgow,United Kingdom")
  local record=${records[$RANDOM % ${#records[@]}]}
  echo "$record"
}

# Generate and write the log entry
log_entry="$(generate_timestamp),$(generate_request_line)"
echo "$log_entry" >> /home/tkopton/explore2024/logs01/csvlog01.csv

