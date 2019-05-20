#!/bin/bash

touch netput.txt
touch netstat.tmp
netstat -antup | awk '{print $5, $6, $7}' | grep '^[1-9]' > netstat.tmp
#cat netstat.tmp

while read myline; do
	IP=`echo $myline | cut -d":" -f1`
	DOMAIN=`nslookup $IP | grep name | cut -d "=" -f2`
	PROC=`echo $myline | awk '{print $3}'`
	STATE=`echo $myline | awk '{print $2}'`
	echo -e "\n\n***********************\n$IP       $STATE\n  $DOMAIN\nproc = $PROC" >> netput.txt
	whois $IP | grep 'OrgName\|City\|State\|ountry\|role\|OrgTechName' >> netput.txt
	echo -e "***********************" >> netput.txt
done < netstat.tmp

rm *.tmp

