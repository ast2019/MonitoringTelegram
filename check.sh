#!/bin/bash
#DateString = $(date "+%d.%m.%y %H:%M") 
IFS=";" read -ra hosts <<< srv.txt

for i in ${hosts[@]} ; do
  if ping -c 1 -w 1 ${hosts[$i]} > /dev/null 
  then
    # send telegram notifaction
    echo ${hosts[$i]}' down'
  else
    echo ${hosts[$i]}' up'
  fi

done
