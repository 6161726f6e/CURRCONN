#!/bin/bash

netstat -antu  | cut -d":" -f2 | sed "/^ *$/d" | awk '{print $2}'| grep '^[1-9]' > IPs.txt 
while read ip; do
	echo -e "***********************"
	echo -e $ip
	echo -e "\n***********************"
	whois $ip
done < IPs.txt
