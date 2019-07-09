#!/bin/bash
#Author: Aaron Dhiman
#
#This script takes a snapshot of current network connections.
#It then prints out useful inforation about all of the connections, 
#such as who owns the remote computer, what application is using each
#connection, what ports are being connected, domain names associated
#with the remote peer, etc.  The results are output to netput.txt
#####################################################################
 
touch netput.txt
touch netstat.tmp
netstat -antup | awk '{print $5, $4, $6, $7}' | grep '^[1-9]' | grep -v '^127' > netstat.tmp
#cat netstat.tmp

while read myline; do
	IP=`echo $myline | awk '{print $1}' | cut -d":" -f1`
	IPP=`echo $myline | awk '{print $1}'`
	DPORT=`echo $myline | awk '{print $1}' | cut -d":" -f2`
	LPORT=`echo $myline | awk '{print $2}' | cut -d":" -f2`
	DOMAIN=`nslookup $IP | grep name | cut -d "=" -f2`
	PROC=`echo $myline | awk '{print $4}' | cut -d "/" -f2`
	STATE=`echo $myline | awk '{print $3}'`

	echo "looking up $IP"
	echo -e "\n\n**********************************************\nproc = $PROC:$LPORT\ndest = $IPP       $STATE\n $DOMAIN\n   \n" >> netput.txt
	whois $IP | grep 'OrgName\|City\|State\|ountry\|role\|OrgTechName' >> netput.txt
	echo -e "*********************************************" >> netput.txt
done < netstat.tmp

echo -e "------------------------\nRESULTS IN netput.txt\n------------------------\n"
rm *.tmp

