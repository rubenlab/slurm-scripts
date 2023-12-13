#!/bin/bash 
#SBATCH -D ./
#SBATCH -J nemotoc
#SBATCH -C scratch

#SBATCH --partition=gpu
#SBATCH -c 24
#SBATCH --gres=gpu:1
#SBATCH --time=59:00
#SBATCH --qos=short

#SBATCH -o slurm-nemotoc-%j.out
#SBATCH -e slurm-nemotoc-%j.err

source /usr/users/rubsak/sw/nemotoc/nemotoc.bashrc

nemotocRun -c conf.py

