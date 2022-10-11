#!/bin/bash -l                                                                                                                                             
#SBATCH -D ./
#SBATCH -J Relion
#SBATCH -C scratch
#SBATCH --partition=XXXqueueXXX
#SBATCH --error=XXXerrfileXXX
#SBATCH --output=XXXoutfileXXX
#SBATCH --ntasks=XXXmpinodesXXX
#SBATCH --mem-per-cpu 8000 
#SBATCH --time=12:00:00
# Default is 3.2G, increase total RAM with e.g. --mem 80G

# TMP_SCRATCH=/scratch/users/$USER/$SLURM_JOB_ID
# mkdir -p $TMP_SCRATCH

module purge
module load singularity/3.8.5 
sif_path="/home/uni08/rubsak/sw/relion/norunscript.sif"

function which() {
  sif_exe=$(singularity exec ${sif_path} /usr/bin/which $1)
#  echo "singularity exec ${sif_path} ${sif_exe}"
  echo "${sif_exe}"
}

echo "Executable: '`which relion_refine_mpi`'"

singularity exec --bind /scratch1/projects/rubsak --bind /local ${sif_path} mpirun XXXcommandXXX

# rm -rf $TMP_SCRATCH