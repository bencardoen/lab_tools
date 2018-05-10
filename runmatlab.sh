#!/bin/bash
# Shorthand script iso alias to start jupyter on cedar

salloc --time=12:0:0 --ntasks=1 --cpus-per-task=4 --mem-per-cpu=120000M --account=rrg-hamarneh --x11 --gres=gpu:1
# salloc --time=6:0:0 --ntasks=1 --cpus-per-task=2 --mem-per-cpu=128000M --account=def-hamarneh srun /home/bcardoen/jupyter_py3/bin/notebook.sh
