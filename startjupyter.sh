#!/bin/bash

#@author Ben Cardoen

CMD='runjupyter'

ssh cedar.computecanada.ca '$CMD /dev/null >/dev/null 2>&1 &'
