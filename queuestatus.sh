#!/usr/bin/env bash

echo -e "Querying Compute Canada Queue (may take some time)..."
squeue -t PENDING| grep "gpu" > gpulist.txt 
echo -e "Done, parsing results..."
JOBCOUNT="$(cat gpulist.txt | wc -l)"
GPUCOUNT="$(cat gpulist.txt | awk -F ' ' '{sum += $8} END {print sum}')"
echo -e "\nTotal nr of jobs in queue is $JOBCOUNT"
echo -e "\nRequested number of GPUS is $GPUCOUNT"
echo -e "\nBreakdown by account id : \nAccount_CCRI Nr of jobs"
cat gpulist.txt | awk '{ a[$2]++ } END { for (n in a) print n, a[n] } '
echo -e "\nBreakdown by PI id : \nPI_CCRI Nr of jobs"
cat gpulist.txt | awk '{ a[$3]++ } END { for (n in a) print n, a[n] } '
rm gpulist.txt
