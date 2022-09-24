#!/bin/bash

# via http://stackoverflow.com/a/34614432
function exec_in_screen {
    name=$1
    command=$2
    screen -S $name -X stuff "$command\n";
}

# 10 mins
exec_in_screen "mcs" "/tellraw @a {\"text\":\"Server is shutting down in a 1 minute\",\"italic\":true,\"color\":\"gray\"}"

# Sleep for 1 minute
sleep 50

# 10 seconds
exec_in_screen "mcs" "/tellraw @a {\"text\":\"Server is shutting down in 10 seconds...\",\"italic\":true,\"color\":\"gray\"}"

# Sleep for 5 seconds
sleep 5

# 5
exec_in_screen "mcs" "/tellraw @a {\"text\":\"Server is shutting down in 5...\",\"italic\":true,\"color\":\"gray\"}"
sleep 1
exec_in_screen "mcs" "/tellraw @a {\"text\":\"Server is shutting down in 4...\",\"italic\":true,\"color\":\"gray\"}"
sleep 1
exec_in_screen "mcs" "/tellraw @a {\"text\":\"Server is shutting down in 3...\",\"italic\":true,\"color\":\"gray\"}"
sleep 1
exec_in_screen "mcs" "/tellraw @a {\"text\":\"Server is shutting down in 2...\",\"italic\":true,\"color\":\"gray\"}"
sleep 1
exec_in_screen "mcs" "/tellraw @a {\"text\":\"Server is shutting down in 1...\",\"italic\":true,\"color\":\"gray\"}"
sleep 1
exec_in_screen "mcs" "/tellraw @a {\"text\":\"Server is shutting down now! Please reconnect in a few minutes.\",\"italic\":true,\"color\":\"gray\"}"

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

echo "Server is shutdown"
