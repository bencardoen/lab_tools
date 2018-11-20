#!/bin/bash
#SBATCH --nodes=1               # number of nodes
#SBATCH --ntasks=1              # number of MPI processes
#SBATCH --cpus-per-task=24      # 24 cores on cedar nodes
#SBATCH --account=rrg-hamarneh
#SBATCH --mem=0                 # give all memory you have in the node
#SBATCH --time=27-00:00         # time (DD-HH:MM)
#SBATCH --job-name=LONG_CONDA_PROCESS
#SBATCH --output=slurm.%N.%j.out
#SBATCH --mail-user=bcardoen@sfu.ca
#SBATCH --mail-type=ALL


# run the command
module load python
python -c "import time;time.sleep(2592000)"

