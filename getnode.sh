#!/bin/bash

# Shell script that finds the Cedar node to which your job was assigned.
# If no node is assigned, return -1
# @author Ben Cardoen,  9 2 18
JOBID=$(squeue -u $USER -t RUNNING  | awk 'FNR == 2 {print $1'})
if [ -z "$JOBID" ]; then
    echo -1
else
    NODE=$(scontrol show job $JOBID | grep BatchHost | sed 's/.*=//')
    echo $NODE
fi
