### Lab Tools
This is a collection of scripts to automate working with Compute Canada, specifically Cedar. 

### Disclaimer
These are scripts written to solve specific tasks, with specific assumptions, some of them implicit and may not apply to your use case. Use at your own risk, and we take no liability or blame whatsoever if applying these wipe out your data, set your lab on fire or invoke the wrath of Cedar's admin team. You're mildly encouraged to contribute to buy us a beer if you find them useful and/or to issue pull requests with your improvements.

##### Requirements
* *Nix Environment (bash, grep, awk, ...)
* SSH key & account configured for Cedar
* Jupyter configured & working on Cedar
* Make or have a remote mount point on your local machine (e.g. /local-scratch/remotemount)
##### Workflow : Starting
* ```$./launchcanada.sh``` Mounts your Cedar:/$HOME on the local mountpoint giving you read-write access as if it is local so you can work with your IDE, file manager etc without copying/synchronizing. If you have a different mountpoint, change $MOUNTPOINT in this script
* ```$ssh cedar.computecanada.ca \<your task script\>``` Start your jupyter session on Cedar
* ```$./setuptunnel.sh [-u username -j cedarport -l localport]``` This script finds the Cedar node where your code is running on, then creates a tunnel from your machine to the node. If no node is assigned, refuses to setup a tunnel. The tunnel uses by default localport 9000, your Linux username, and 8989 as Cedar port. Override by CLargs.
  
#### Workflow : Stopping
* ```$./abortcanada.sh``` kills (!! all !!) ssh tunnels, dismounts the remote filesystem
  
  
##### Environment 
* Assumes /local-scratch/remotemount as local mountpoint 
* Assumes your userid on Cedar is the same on your local system, if not override by CLI-arg
* Local port : 9000
* Remote port : 8989
* SSHFS tuned so that it writes only every 5 minutes, instead of every 20 seconds. SSH is not the lightest of protocols, so this optimizes throughput for latency.

##### Other
* queuestatus.sh: Checks the number of GPUs queued for use in Cedar, and prints out the guilty users in the queue. This can give you a rough idea of how long your job will spend in queue.
