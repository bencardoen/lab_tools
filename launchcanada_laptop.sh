#!/bin/bash
#@author Ben Cardoen
#Remote mounts Cedar home drive

MOUNTPOINT="/home/bcardoen/mountcedar/"
echo "Mounting remote file systems to $MOUNTPOINT ..."
mountremote="sshfs cedar.computecanada.ca:/home/$USER  $MOUNTPOINT -C -o follow_symlinks -o cache=yes -o reconnect -o cache_timeout=300"
exec $mountremote
echo "Done"
