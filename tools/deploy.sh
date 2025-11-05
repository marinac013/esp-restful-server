#!/bin/bash

# Get the directory of the currently executing script, resolving symlinks
SCRIPT_DIR="$(cd -P "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# Define the device and target
DEVICE="/dev/ttyUSB0"
TARGET="esp32"

# Deploy the front-end web application
cd ../front/web || exit 1
npm run build || exit 2

# Source the ESP-IDF environment
cd ~/esp/esp-idf
. ./export.sh

# Change to the project directory to back-end firmware
cd "$SCRIPT_DIR/../" || exit 3

# # Set the target to ESP32
#idf.py set-target "$TARGET" || exit 4

# # Build the back-end firmware
idf.py build || exit 5

# # Flash the firmware to the device
idf.py -p "$DEVICE" flash || exit 6

# # Monitor the serial output
#idf.py -p "$DEVICE" monitor || exit 7

# Successful deployment
exit 0
