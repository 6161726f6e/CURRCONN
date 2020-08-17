#!/bin/bash
# Author: Aaron Dhiman
#
# Description: This script takes a snapshot of current network connections.
#  It then prints out useful inforation about all of the connections, 
#  such as who owns the remote computer, what application is using each
#  connection, what ports are being connected, domain names associated
#  with the remote peer, etc.  The results are output to netput.txt
#
#  NOTE: Run as root to get system procs
#  NOTE: Procs in TIME_WAIT will not have active PID info
#####################################################################

filename=netput-`date +%H:%M:%S`.txt
netstat -antup | awk '{print $5, $4, $6, $7}' | grep '^[1-9]' | grep -v '^127' > netstat.tmp
#cat netstat.tmp

while read myline; do
	IP=`echo $myline | awk '{print $1}' | cut -d":" -f1`
	IPP=`echo $myline | awk '{print $1}'`
	DPORT=`echo $myline | awk '{print $1}' | cut -d":" -f2`
	LPORT=`echo $myline | awk '{print $2}' | cut -d":" -f2`
	DOMAIN=`nslookup $IP | grep name | cut -d "=" -f2`
	PROC=`echo $myline | awk '{print $4}' | cut -d "/" -f2`
	PID=`echo $myline | awk '{print $4}' | cut -d "/" -f1`
	PS_ALL=`ps aux | grep $PID` 
	PS_DETAIL=`echo "$PS_ALL"| grep $PID` 
	STATE=`echo $myline | awk '{print $3}'`

	echo "looking up $IP"
	echo -e "\n\n**********************************************\nproc:port = $PROC:$LPORT" >> $filename
	echo -e "PID = $PID" >> $filename
	#echo "DEBUG &&&&&&&&& $myline" >> $filename
	#echo -e "DEBUG ^^^^^^^^^^^ PS_DETAIL = $PS_DETAIL" >> $filename
	#echo -e "DEBUG ^^^^^^^^^^^ PROC = $PROC" >> $filename
	if [ "$PID" != "-" ]
	then 
		echo -e "ACTIVE PS DETAILS:\n     $PS_DETAIL " >> $filename
	fi
	echo -e "\ndest_IP = $IPP       $STATE" >> $filename
        echo -e "hostnm = $DOMAIN\n" >> $filename
	whois $IP | grep 'OrgName\|City\|State\|ountry\|role\|OrgTechName' >> $filename
	echo -e "*********************************************" >> $filename
done < netstat.tmp

echo -e "------------------------\nRESULTS IN $filename\n------------------------\n"
rm *.tmp

