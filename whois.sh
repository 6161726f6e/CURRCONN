#!/bin/bash

touch netput.txt
netstat -antup  | cut -d":" -f2 | sed "/^ *$/d" | awk '{print $2}'| grep '^[1-9]' > IPs.txt 
while read ip; do
	echo -e "\n\n***********************\n$ip\n***********************" >> netput.txt
	whois $ip | grep 'OrgName\|City\|State\|Coun' >> netput.txt
done < IPs.txt
