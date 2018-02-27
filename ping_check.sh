#!/bin/bash
declare -a hosts

for hosts in "vpn" "cloud" "worker1" "worker2" "www" "www1" "www2"
do
  if ping -c 1 "$hosts.miche1.de" >> /dev/null
  then
    echo "$hosts up"
  else
    echo "$hosts down"
    # send notifaction to a specified telegram chat 
    curl -X  POST "https://api.telegram.org/bot468538263:AAE6SsDgZ3SlEVYH3AkC09_6lxmonHH2cIY/sendMessage?chat_id=275076593&text=$hosts.miche1.de down!"
  fi
done
