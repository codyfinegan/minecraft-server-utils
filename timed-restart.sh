#!/bin/bash

# via http://stackoverflow.com/a/34614432
function start_screen {
    name=$1
    command=$2
    screen -dmS $name sh; sleep 1; screen -S $name -X stuff "$command\n";
}

function exec_in_screen {
    name=$1
    command=$2
    screen -S $name -X stuff "$command\n";
}

# 10 mins
exec_in_screen "mcs" "/tellraw @a {\"text\":\"Server is restarting in 10 minutes...\",\"italic\":true,\"color\":\"gray\"}"

# Sleep for 5 minutes
sleep 300

# 5 mins
exec_in_screen "mcs" "/tellraw @a {\"text\":\"Server is restarting in 5 minutes...\",\"italic\":true,\"color\":\"gray\"}"

# Sleep for 3 minutes
sleep 180

# 2 mins
exec_in_screen "mcs" "/tellraw @a {\"text\":\"Server is restarting in 2 minutes...\",\"italic\":true,\"color\":\"gray\"}"

# Sleep for 1 minute
sleep 60

# 1 mins
exec_in_screen "mcs" "/tellraw @a {\"text\":\"Server is restarting in 1 minute...\",\"italic\":true,\"color\":\"gray\"}"

# Sleep for 50 seconds
sleep 50

# 10 seconds
exec_in_screen "mcs" "/tellraw @a {\"text\":\"Server is restarting in 10 seconds...\",\"italic\":true,\"color\":\"gray\"}"

# Sleep for 5 seconds
sleep 5

# 5
exec_in_screen "mcs" "/tellraw @a {\"text\":\"Server is restarting in 5...\",\"italic\":true,\"color\":\"gray\"}"
sleep 1
exec_in_screen "mcs" "/tellraw @a {\"text\":\"Server is restarting in 4...\",\"italic\":true,\"color\":\"gray\"}"
sleep 1
exec_in_screen "mcs" "/tellraw @a {\"text\":\"Server is restarting in 3...\",\"italic\":true,\"color\":\"gray\"}"
sleep 1
exec_in_screen "mcs" "/tellraw @a {\"text\":\"Server is restarting in 2...\",\"italic\":true,\"color\":\"gray\"}"
sleep 1
exec_in_screen "mcs" "/tellraw @a {\"text\":\"Server is restarting in 1...\",\"italic\":true,\"color\":\"gray\"}"
sleep 1
exec_in_screen "mcs" "/tellraw @a {\"text\":\"Server is restarting now!\",\"italic\":true,\"color\":\"gray\"}"

echo "Stoppings service"
exec_in_screen "mcs" "/stop"

# Wait for 10 seconds
sleep 10

# Wait for minecraft to finish
while pgrep java > /dev/null; do sleep 2; echo 'Waiting for server to stop...'; done

# Ok, now kill the screen service
exec_in_screen "mcs" "^D"

# Confirm screen finished
while pgrep java > /dev/null; do sleep 2; echo 'Waiting for screen to stop...'; done

echo "Starting server..."
start_screen "mcs" "$MCSU_SERVERCMD"
echo "Server has restarted, give it a minute for minecraft to boot"