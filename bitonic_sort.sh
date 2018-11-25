#!/bin/sh
#SBATCH --nodes=8
#SBATCH --ntasks-per-node=1
#SBATCH --constraint=IB
#SBATCH --partition=general-compute --qos=general-compute
#SBATCH --time=12:00:00
#SBATCH --mail-type=END
#SBATCH --mail-user=sajidkha@buffalo.edu
#SBATCH --output=bitonic_sort.out
#SBATCH --job-name=bitonic_sort
 
module load intel/14.0
module load intel-mpi/4.1.3
module list
mpicc -lm -o bitonic_sort bitonic_sort.c
ulimit -s unlimited

export I_MPI_PMI_LIBRARY=/usr/lib64/libpmi.so

srun ./bitonic_sort 33554432

#
echo "All done!"
