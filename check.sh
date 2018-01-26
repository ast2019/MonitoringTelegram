#!/bin/bash

DateString = $(date "+%d.%m.%y %H:%M") 

IFS=";" read -ra hosts < srv.hosts

for i in ${hosts[@]}
do
  if ping -c 1 -w 1 $ > /dev/null 
  then
    # send telegram notifaction
    echo ${hosts[$i]}' down'
  else
    echo ${hosts[$i]}' up'
  fi
done
