#!/bin/bash

# Define the path to the Python script
python_script="/home/pi/client/log_data/log_data_EnergyTake.py"

# Check if the Python script exists
if [ -f "$python_script" ]; then
    # Execute the Python script
    python3 "$python_script"
else
    echo "Error: Python script not found at $python_script"
fi

# Sleep for 10 seconds
sleep 10
