This bash script obtains a status of a machine's current network connections and extracts all TCP and UDP destinations in contact with the machine.

It will then look up details on the owner of the remote IP and print useful information about it (e.g., Org, Location, associated PID, port, Reverse DNS, etc.).  

The results are written to netput.txt.

Future enhancments will include Shodan lookups on the remote destinations, website domains associated with the IPs, and VirusTotal information about them.

# Executing Script (run as root to get proc info for all connections)
**********************************************
╰─⠠⠵ sudo ./whois.sh 

  looking up 140.82.113.4

  RESULTS IN netput-14:18:45.txt

**********************************************

╰─⠠⠵ cat netput-14:18:45.txt
  
  proc = chromium:32966
  
  dest = 140.82.113.4:443       ESTABLISHED
  
    lb-140-82-113-4-iad.github.com.
    
  OrgName:        GitHub, Inc.
  
  City:           San Francisco
  
  StateProv:      CA
  
  Country:        US
  
  OrgTechName:   GitHub Ops
  
  *********************************************
