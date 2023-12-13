#!/bin/bash 
#SBATCH -D ./
#SBATCH -J SNARTomo
#SBATCH -C scratch
#SBATCH --partition=gpu
#SBATCH -G rtx5000:1
#SBATCH --time=00:40:00
#SBATCH --cpus-per-task=2
# SBATCH --mem 8G

unset ${!SLURM_@}
#module load cuda/10.2.89
shopt -s expand_aliases
source /usr/users/rubsak/sw/rubsak.bashrc
use_snartomo

module list
echo "Conda environment: $(basename $CONDA_DEFAULT_ENV)"

snartomo-pace --target_files TS/lam6_tgts.txt --eer_dir frames --gpus 0 --apix 2.94 --frame_file motioncor-frames.txt --gain_file frames/20230726_133151_EER_GainReference.gain  

