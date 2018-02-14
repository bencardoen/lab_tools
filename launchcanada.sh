#!/bin/bash
#@author Ben Cardoen
#Remote mounts Cedar home drive

MOUNTPOINT="/local-scratch/remotemount"
echo "Mounting remote file systems"
mountremote="sshfs cedar.computecanada.ca:/home/$USER  $MOUNTPOINT -o follow_symlinks -o cache=yes -o reconnect -o cache_timeout=300"
exec $mountremote
echo "Done"
