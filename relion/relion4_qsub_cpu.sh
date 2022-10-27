#!/bin/bash -l                                                                                                                                             
#SBATCH -D ./                                                                                                                                              
#SBATCH -J Relion                                                                                                                                          
#SBATCH -C scratch                                                                                                                                         
#SBATCH --partition=XXXqueueXXX
#SBATCH --error=XXXerrfileXXX
#SBATCH --output=XXXoutfileXXX
#SBATCH --ntasks=XXXmpinodesXXX
#SBATCH --mem-per-cpu 8000 
#SBATCH --time=24:00:00
# Default is 3.2G, increase total RAM with e.g. --mem 80G

module purge
#module load openmpi/4.1.1
#shopt -s expand_aliases
#source /usr/users/rubsak/sw/rubsak.bashrc
#use_relion4
load relion/4.0.0
echo -e "$(hostname) modules: $(module list 2>&1 | grep relion --color=never) \n"
 
mpirun XXXcommandXXX

