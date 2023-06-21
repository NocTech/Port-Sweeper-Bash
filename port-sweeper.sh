#!/bin/bash

computer="localhost"
startPort=1
endPort=65535

colorOffline="Red"
colorOnline="Green"

for ((port=startPort; port<=endPort; port++)); do
    result=$(nc -z -w1 $computer $port >/dev/null 2>&1 && echo "open" || echo "closed")

    if [ "$result" == "open" ]; then
        echo "Port $port is open" | awk -v color="$colorOnline" '{printf "\033[0;%sm%s\033[0m\n", color, $0}'
    else
        echo "Port $port is closed" | awk -v color="$colorOffline" '{printf "\033[0;%sm%s\033[0m\n", color, $0}'
    fi
done
