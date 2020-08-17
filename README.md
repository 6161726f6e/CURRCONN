This bash script obtains a status of a machine's current network connections and extracts all TCP and UDP destinations in contact with the machine.

It will then look up details on the owner of the remote IP and print useful information about it (e.g., Org, Location, associated PID, process details, port, Reverse DNS, etc.).  

The results are written to netput.txt.

Future enhancments will include Shodan lookups on the remote destinations, website domains associated with the IPs, and VirusTotal information about them.

**Executing Script (run as root to get proc info for all connections)**
***********************************************************************
```
╰─⠠⠵ sudo ./whois.sh

looking up 140.82.113.25
looking up 172.217.9.206
-----------------------------
RESULTS IN netput-14:49:22.txt



╰─⠠⠵ cat netput-14:49:22.txt

**********************************************
proc:port = chromium:43734
PID = 324438
ACTIVE PS DETAILS:
     usera     324438  0.1  0.8 1385148 130176 ?      SLl  14:39   0:01 /usr/lib/chromium/chromium --type=utility --field-trial-handle=9347145869561846045,3964362211459982302,131072 --enable-features=DismissNtpPromos,NtpRealbox --lang=en-US --service-sandbox-type=network --disable-webrtc-apm-in-audio-service --shared-files=v8_snapshot_data:100 

dest_IP = 140.82.113.25:443       ESTABLISHED
hostnm =  lb-140-82-113-25-iad.github.com.

OrgName:        GitHub, Inc.
City:           San Francisco
StateProv:      CA
Country:        US
OrgTechName:   GitHub Ops
*********************************************

**********************************************
proc:port = chromium:41608
PID = 324438
ACTIVE PS DETAILS:
     usera     324438  0.1  0.8 1385148 130176 ?      SLl  14:39   0:01 /usr/lib/chromium/chromium --type=utility --field-trial-handle=9347145869561846045,3964362211459982302,131072 --enable-features=DismissNtpPromos,NtpRealbox --lang=en-US --service-sandbox-type=network --disable-webrtc-apm-in-audio-service --shared-files=v8_snapshot_data:100 

dest_IP = 172.217.9.206:443       ESTABLISHED
hostnm =  iad30s14-in-f14.1e100.net.

OrgName:        Google LLC
City:           Mountain View
StateProv:      CA
Country:        US
OrgTechName:   Google LLC
*********************************************

```
