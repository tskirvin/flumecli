# Quick little CLI interface for the flume API.

*This script is currently written to explictly log data for just the last 1 minute assuming.  There's lots of options available from flume.  Feel free to make this code more robust/configurable*

## What you will need
* Your API client ID and secret.  You have to get this through the flumetech portal: https://portal.flumetech.com/#dashboard
* Your username and password for the portal.  
* Only 1 flume device.  I wrote this code to work with a single flume sensor.  I have no idea what will happen if you have more than one.
* If you want to send to Splunk you will need to log to a file (using --logfile) and collect with a UF, or you need an HTTP event collector token/URL.
	* I have no idea if this works with HTTPS HEC.  Try it out :D

## How does it work
1. First you need to establish a JWT/Token.  This requires client ID & secret as well as username and password.  You need to specify a tokenfile to write the resulting token to.
	* `flumecli.py --auth --clientid <clientid> --clientsecret <clientsecret> --username <flumetech username> --password <flumetech password> --tokenfile <pathtofile>`
2. You may want to have a look at the details of your environment.  These can be used to interface with the API directly or using other systems.
	* `flumecli.py --details --tokenfile <pathtofile>`
	* Your User ID and Device ID are generated by the flume system.  These are often required when interacting with other API calls
3. Query the flume API.  There's a query language from flume but for the purposes of this script I'm just looking at the last 1 minute of water flow, assuming that you just schedule this script to run every minute.  There's a number of different ways to output this data.
	1. `flumecli.py --query --tokenfile <pathtofile>` **Simple query with output to stdout showing timestamp and water flow from last minute**
	2. `flumecli.py --query --tokenfile <pathtofile> --logfile <pathtologfile>` **Same output as above, except the output gets appended to the specified file**
	3. `flumecli.py --query --tokenfile <pathtofile> --hecurl <full hec url> --hectoken <hec token>` **Outputs the value directly to HEC**

## Read the --help on the command line.  There are some other options available.
