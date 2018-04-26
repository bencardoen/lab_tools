#!/bin/bash


PATH=$PATH:$HOME/.local/bin:$HOME/bin

export PATH

source $HOME/jupyter_py3/bin/activate

module load julia

runjupyter='salloc --time=3:0:0 --ntasks=1 --cpus-per-task=4 --mem-per-cpu=32000M --account=def-hamarneh srun /home/bcardoen/jupyter_py3/bin/notebook.sh'

exec $runjupyter &> ./sallocoutput/out.txt &
