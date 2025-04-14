#!/bin/bash
echo "Suspicious processes using ports <1024 or running as root:"
ps -eo pid,user,comm,args | while read pid user comm args; do
    port=$(netstat -tulnp 2>/dev/null | grep "$pid" | awk '{print $4}')
    if [[ "$user" == "root" && "$port" =~ :([0-9]{1,4})$ ]]; then
        echo "$pid $user $comm $args on $port"
    fi
done
