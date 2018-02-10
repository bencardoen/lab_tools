#!/bin/bash

# Script to setup a tunnel to the cedar node running your job automatically
# @author Ben Cardoen

echo "Usage : ./setuptunnel.sh [-u <USERNAME> -l <LOCALPORT> -j <CEDARPORT>]"
LOCALPORT=9000
CEDARPORT=8989
CAUSER=$USER

while getopts ":l:u:j:" opt; do
  case $opt in
    l)
      echo "Setting local port to $OPTARG" >&2
      LOCALPORT=$OPTARG
      ;;
    j)
      echo "Setting Cedar port  to $OPTARG" >&2
      CEDARPORT=$OPTARG
      ;;
    u)
      echo "Setting user  to $OPTARG" >&2
      CAUSER=$OPTARG
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      exit 1
      ;;
    :)
      echo "Option -$OPTARG requires an argument." >&2
      exit 1
      ;;
  esac
done

LOCALPORT=9000
CEDARPORT=8989
CAUSER=$USER

CEDARNODE=$(ssh $USER@cedar.computecanada.ca ./getnode.sh)
if (( $CEDARNODE == -1 ));then
  echo "---!!!--- No node was assigned to you by cedar, so setting up a tunnel is somewhat beyond the capabilities of this script. ---!!!---"
  echo "---!!!--- squeue -u <you> in Cedar will help you out.---!!!---"
  exit -1
else
  ssh -N -f -L $LOCALPORT:$CEDARNODE.int.cedar.computecanada.ca:$CEDARPORT $CAUSER@cedar.computecanada.ca
  exit 0
fi
