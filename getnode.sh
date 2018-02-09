#!/bin/bash

# Shell script that finds the Cedar node to which your job was assigned.
# @author Ben Cardoen,  9 2 18
JOBID=$(squeue -u bcardoen -t RUNNING  | awk 'FNR == 2 {print $1'})
NODE=$(scontrol show job $JOBID | grep BatchHost | sed 's/.*=//')
echo $NODE
