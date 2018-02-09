#!/bin/bash

# Script to setup a tunnel to the cedar node running your job automatically

LOCALPORT=9000
CEDARPORT=8989

CEDARNODE=$(ssh $USER@cedar.computecanada.ca ./getnode.sh)
ssh -N -f -L $LOCALPORT:$CEDARNODE.int.cedar.computecanada.ca:$CEDARPORT $USER@cedar.computecanada.ca
