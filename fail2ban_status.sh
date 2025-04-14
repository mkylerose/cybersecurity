#!/bin/bash
sudo fail2ban-client status
echo ""
jails=$(sudo fail2ban-client status | grep "Jail list" | cut -d: -f2 | tr ',' ' ')
for jail in $jails; do
    echo "Status for $jail:"
    sudo fail2ban-client status "$jail"
    echo ""
done
