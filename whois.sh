#!/bin/bash

touch netput.txt
touch netstat.tmp
touch netstat2.tmp
touch netstat3.tmp
netstat -antup | awk '{print $5, $6, $7}' > netstat.tmp
cat netstat.tmp | grep '^[1-9]' > netstat2.tmp

while read myline; do
	echo $myline | cut -d":" -f1 >> netstat3.tmp
	IP=`echo $myline | cut -d":" -f1`
	PROC=`echo $myline | awk '{print $3}'`
	echo -e "\n\n***********************\n$IP\n$PROC" >> netput.txt
	whois $IP | grep 'OrgName\|City\|State\|ountry\|role' >> netput.txt
	echo -e "***********************" >> netput.txt
done < netstat2.tmp

rm *.tmp

