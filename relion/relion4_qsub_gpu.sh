#!/bin/bash -l                                                                                                                                             
#SBATCH -D ./                                                                                                                                              
#SBATCH -J Relion                                                                                                                                          
#SBATCH -C scratch                                                                                                                                         

#SBATCH --partition=XXXqueueXXX
#SBATCH --error=XXXerrfileXXX
#SBATCH --output=XXXoutfileXXX
#SBATCH --ntasks=XXXmpinodesXXX
#SBATCH --gres=gpu:2
#SBATCH --mem-per-cpu 8000 
#SBATCH --time=18:00:00
# Default is 3.2G, increase total RAM with e.g. --mem 80G

# TMP_SCRATCH=/scratch/users/$USER/$SLURM_JOB_ID
# mkdir -p $TMP_SCRATCH

module purge
module load relion/4.0.0-cuda

# Diagnostics
ldd `which relion_refine_mpi` | grep psm2
echo -e "$(hostname) modules: $(module list 2>&1 | grep relion --color=never) \n"
  
mpirun XXXcommandXXX

# rm -rf $TMP_SCRATCH
