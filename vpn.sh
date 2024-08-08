#!/bin/bash
now="$(date)"

VPNCON=$(nmcli con show Minster | grep VPN.VPN-STATE | awk '{print $2}')
if [[ $VPNCON != "5" ]]; then
    echo "$now" " : Disconnected, trying to reconnect..."
    (sleep 1 && sudo nmcli con up Minster)
else
    echo "$now" " : Already connected !"
fi

sleep 60

while [ "true" ]
do
    now="$(date)"
    VPNCON=$(nmcli con show Minster | grep VPN.VPN-STATE | awk '{print $2}')
    if [[ $VPNCON != "5" ]]; then
        echo "$now" " : Disconnected, trying to reconnect..."
        (sleep 1 && sudo nmcli con up Minster)
    fi

    sleep 300
done
