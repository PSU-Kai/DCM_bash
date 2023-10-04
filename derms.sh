#!/bin/bash

# Name of the tmux session
SESSION_NAME="DERMS"

# Directory where the script is located
SCRIPT_DIR="/home/pi/water_heaters_testings/dcs/build/debug"

# Command to execute the Python script
PYTHON_SCRIPT="python3 dcm_log_data.py"

# Check if the session exists
tmux has-session -t "$SESSION_NAME" 2>/dev/null

if [ $? != 0 ]; then
    # If the session doesn't exist, create it
    tmux new-session -d -s "$SESSION_NAME" -c "$SCRIPT_DIR"
fi

# Create a new pane named "DATA" in the tmux session
tmux split-window -h -t "$SESSION_NAME" -c "$SCRIPT_DIR"

# Send the command to execute the Python script to the new pane
tmux send-keys -t "$SESSION_NAME" "cd $SCRIPT_DIR && $PYTHON_SCRIPT" C-m

# Switch to the new pane
tmux select-pane -t "$SESSION_NAME.1"
