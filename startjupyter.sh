#!/bin/bash

#@author Ben Cardoen

CMD='/home/bcardoen/repositories/lab_tools/runjupyter.sh'

ssh cedar.computecanada.ca '$CMD /dev/null >/dev/null 2>&1 &'
