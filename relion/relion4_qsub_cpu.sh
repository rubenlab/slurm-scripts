#!/bin/bash -l                                                                                                                                             
#SBATCH -D ./                                                                                                                                              
#SBATCH -J Relion                                                                                                                                          
#SBATCH -C local                                                                                                                                        
#SBATCH --partition=XXXqueueXXX
#SBATCH --error=XXXerrfileXXX
#SBATCH --output=XXXoutfileXXX
#SBATCH --ntasks=XXXmpinodesXXX
#SBATCH --mem-per-cpu 8000 
#SBATCH --time=24:00:00
# Default is 3.2G, increase total RAM with e.g. --mem 80G

module purge
module load rev/20.12 spack-user/0.16.0
source $SPACK_USER_ROOT/share/spack/setup-env.sh
spack load relion@4.0_beta
  
mpirun XXXcommandXXX

