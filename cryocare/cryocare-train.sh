#!/bin/bash -l
#SBATCH -D ./
#SBATCH -J cryoCARE
#SBATCH -C scratch

#SBATCH --partition=gpu
#SBATCH --mem-per-cpu 6000 
#SBATCH --gres=gpu:2

#SBATCH -o slurm-cryocare-%j.out
#SBATCH -e slurm-cryocare-%j.err

module purge
#module load cuda/10.2.89
module load cuda/11.5.1
#export KERAS_BACKEND=tensorflow  # NEEDED?
#shopt -s expand_aliases
#source /usr/users/rubsak/sw/rubsak.bashrc
#use_cryocare
source /usr/users/rubsak/sw/conda/conda_rubsak.bash cryocare_c11

module list
echo "Conda evironment: $(basename $CONDA_DEFAULT_ENV)"

#cryoCARE_extract_train_data.py --conf train_data_config.json && \
cryoCARE_train.py --conf train_config.json

