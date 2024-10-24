#!/bin/bash

# Function to generate a random IP address
generate_ip() {
  echo "$((RANDOM % 256)).$((RANDOM % 256)).$((RANDOM % 256)).$((RANDOM % 256))"
}

# Function to generate a random user identifier
generate_user_identifier() {
  echo "-"
}

# Function to generate a random user ID
generate_user_id() {
  echo "user$((RANDOM % 1000))"
}

# Function to generate a CLF formatted timestamp
generate_timestamp() {
  date -u +"%Y-%m-%dT%H:%M:%S.%3NZ"
}

# Function to generate a random HTTP request line
generate_request_line() {
  local methods=("GET" "POST" "PUT" "DELETE")
  local resources=("/index.html" "/about.html" "/contact.html" "/api/data")
  local method=${methods[$RANDOM % ${#methods[@]}]}
  local resource=${resources[$RANDOM % ${#resources[@]}]}
  echo "\"$method $resource HTTP/1.0\""
}

# Function to generate a random HTTP status code
generate_status_code() {
  local codes=(200 301 404 500)
  echo "${codes[$RANDOM % ${#codes[@]}]}"
}

# Function to generate a random response size in bytes
generate_response_size() {
  echo "$((RANDOM % 10000 + 100))"
}

# Function to determine log type and message
generate_log_type_and_message() {
  local types=("INFO" "ERROR")
  local type=${types[$RANDOM % ${#types[@]}]}
  
  if [ "$type" == "INFO" ]; then
    echo "$type: Request processed successfully."
  else
    echo "$type: Failed to process request."
  fi
}

# Generate and write the log entry
log_entry="$(generate_timestamp) $(generate_ip) $(generate_user_identifier) $(generate_user_id) $(generate_request_line) $(generate_status_code) $(generate_response_size) $(generate_log_type_and_message)"
echo "$log_entry" >> /home/tkopton/explore2024/logs02/network.log


