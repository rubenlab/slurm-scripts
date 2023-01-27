#!/bin/bash -l
#SBATCH -D ./
#SBATCH -J ModelAngelo
#SBATCH -C scratch

#SBATCH --partition=gpu
#SBATCH --gres=gpu:1
#SBATCH --time=2:00:00
#SBATCH --qos=short

#SBATCH -o modelangelo-%j.out
#SBATCH -e modelangelo-%j.err

module purge
shopt -s expand_aliases
source /usr/users/rubsak/sw/rubsak.bashrc
use_modelangelo

model_angelo build -f human_asyn_full.fasta -v J61_postprocess_bottom.mrc -o J61_pp_bottom

