
#!/bin/bash

# Define the path to the Python scripts
# log_data_script="/home/pi/client/log_data/log_data_EnergyTake.py"
dcm_client_script="/home/pi/client/dcm_client.py"

# Check if the log_data Python script exists
#if [ -f "$log_data_script" ]; then
    # Execute the log_data script
 #   python3 "$log_data_script" &
#else
 #   echo "Error: log_data Python script not found at $log_data_script"
#fi

# Loop to execute the client script every 30 seconds
while true; do
    if [ -f "$dcm_client_script" ]; then
        # Execute the client script
        python3 "$dcm_client_script"
    else
        echo "Error: dcm_client Python script not found at $dcm_client_script"
    fi

    # Sleep for 30 seconds before running the client script again
    sleep 60
done

