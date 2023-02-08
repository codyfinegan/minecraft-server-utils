#!/bin/bash

# via http://stackoverflow.com/a/34614432
function exec_in_screen {
    name=$1
    command=$2
    screen -L -Logfile mcscreen.log -dmS $name sh; sleep 1; screen -S $name -X stuff "$command\n";
}

# wait for system to be in a usable state
sleep 10

# start server in screen session mcs
exec_in_screen "mcs" "$MCSU_SERVERCMD"
