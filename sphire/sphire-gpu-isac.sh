#!/bin/bash 

#SBATCH -D ./
#SBATCH -J sp_isac
#SBATCH -C scratch
#SBATCH --partition=gpu
#SBATCH --exclusive
#SBATCH --gres=gpu:2
#SBATCH --time=11:59:00
#SBATCH -n 8
#SBATCH -o slurm-isac-%j.out
#SBATCH -e slurm-isac-%j.err

module purge
module load openmpi/4.1.1
module load cuda/10.2

#source ~/bin/rubsak.bashrc
#use_sphire
source /usr/users/rubsak/sw/conda/conda_rubsak.bash eman-2.31

module list
#echo "Conda evironment: $(basename $CONDA_DEFAULT_ENV)"

echo -e "SLURM_NTASKS: $SLURM_NTASKS\n"

mpirun -np $SLURM_NTASKS sp_isac2_gpu.py bdb:Window#data ISAC/Nomask --radius=111 --img_per_grp=1500 --CTF --gpu_devices=0,1 --gpu_memory_use=0.8 --xr=0 

