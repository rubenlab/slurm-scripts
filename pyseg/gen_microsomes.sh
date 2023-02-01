#!/bin/bash -l
#SBATCH -D ./
#SBATCH -J pyseg_test
#SBATCH -C scratch
#SBATCH --mem-per-cpu 64000 
#SBATCH --partition=medium
#SBATCH -n 3
#SBATCH --time=00:60:00
#SBATCH -o slurm-pyseg-%j.out
#SBATCH -e slurm-pyseg-%j.err

module purge
shopt -s expand_aliases
source /usr/users/rubsak/sw/rubsak.bashrc
use_pyseg
echo -e "python : '$(which python)'\n"  # DIAGNOSTIC

python gen_microsomes.py

