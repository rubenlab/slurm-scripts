#!/bin/bash -l                                                                                                                                             
#SBATCH -D ./                                                                                                                                              
#SBATCH -J relion_reconstruct
#SBATCH -C scratch                                                                                                                                         
#SBATCH --partition=medium
#SBATCH --error=run.err
#SBATCH --output=run.out
#SBATCH --ntasks=1
#SBATCH --exclusive 
#SBATCH --qos=short
#SBATCH --time=01:00:00
# Default is 3.2G, increase total RAM with e.g. --mem 80G

module purge
module load openmpi/4.1.1
shopt -s expand_aliases
source /usr/users/rubsak/sw/rubsak.bashrc
use_relion4
 
relion_reconstruct --i Refine3D/Max_probable/run_data.star --o test.mrc --ctf

