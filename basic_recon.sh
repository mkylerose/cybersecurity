#!/bin/bash
target="$1"
if [ -z "$target" ]; then
    echo "Usage: $0 <target>"
    exit 1
fi
echo "DNS Info:"
dig "$target" +short
echo "Traceroute:"
traceroute "$target"
echo "Ping Sweep:"
nmap -sn "$target"/24
echo "Port Scan:"
nmap -Pn "$target"
