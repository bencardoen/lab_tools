#!/bin/bash

salloc --time=6:0:0 --ntasks=1 --cpus-per-task=2 --mem-per-cpu=64000M --account=def-hamarneh srun /home/bcardoen/jupyter_py3/bin/notebook.sh
