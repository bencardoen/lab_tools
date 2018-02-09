#!/bin/bash

MOUNTPOINT="/local-scratch/remotemount"
echo "Mounting remote file systems"
mountremote="sshfs cedar.computecanada.ca:/home/$USER  $MOUNTPOINT -o follow_symlinks"
exec $mountremote
echo "Done"
