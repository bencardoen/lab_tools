#### Lab Tools
This is a collection of scripts to automate working with Compute Canada, specifically Cedar. 
##### Requirements
* *Nix Environment (bash, grep, awk, ...)
* SSH key & account configured for Cedar
* Jupyter configured & working on Cedar
* Make or have a remote mount point on your local machine (e.g. /local-scratch/remotemount)
##### Workflow : Starting
* ./launchcanada.sh: This will mount your $HOME in Cedar on the local mountpoint giving you read-write access as if it is local so you can work with your IDE, file manager etc without copying/synchronizing. If you have a different mountpoint, change $MOUNTPOINT in this script
* ssh cedar.computecanada.ca \<your task script\>: typically something that starts jupyter
* ./setuptunnel.sh [-u username -j cedarport -l localport]: This script finds the Cedar node where your code is running on, then creates a tunnel from your machine to the node. If no node is assigned, refuses to setup a tunnel. The tunnel uses by default localport 9000, your Linux username, and 8989 as Cedar port. Override by CLargs.
  
#### Workflow : Stopping
* ./abortcanada.sh : kills (!! all !!) ssh tunnels, dismounts the remote filesystem
  
  
##### Environment 
* Assumes /local-scratch/remotemount as local mountpoint 
* Local port : 9000
* Remote port : 8989

##### Other
* queuestatus.sh: Checks the number of GPUs queued for use in Cedar, and prints out the guilty users in the queue. This can give you a rough idea of how long your job will spend in queue.
