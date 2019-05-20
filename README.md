This bash script obtains a status of a machine's current network connections and extracts all TCP and UDP destinations in contact with the machine.

It will then look up details on the owner of the remote IP and print useful information about it (e.g., Org, Location, associated PID, etc.).  

The results are written to netput.txt.

Future enhancments will include Shodan lookups on the remote destinations, website domains associated with the IPs, and VirusTotal information about them.
