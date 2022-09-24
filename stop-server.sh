#!/bin/bash

# via http://stackoverflow.com/a/34614432
function exec_in_screen {
    name=$1
    command=$2
    screen -S $name -X stuff "$command\n";
}

function give_time_warning {
    time=$1
    wait=$2
    exec_in_screen "mcs" "/tellraw @a {\"text\":\"Server is restarting ${time}\",\"italic\":true,\"color\":\"gray\"}"
    echo "'${time}' warning given"
    sleep $wait
}

give_time_warning "in 1 minute" 50

# Countdown
give_time_warning "in 10 seconds" 5
give_time_warning "in 5" 1
give_time_warning "in 4" 1
give_time_warning "in 3" 1
give_time_warning "in 2" 1
give_time_warning "in 1" 1
give_time_warning "now!" 0


echo "Kicking users!"
exec_in_screen "mcs" "/kick @a Server is restarting, give it a couple of minutes"

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
