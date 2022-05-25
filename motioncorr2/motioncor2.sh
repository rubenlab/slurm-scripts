#!/bin/bash -l
#SBATCH -D ./
#SBATCH -J MotionCor2
#SBATCH -C scratch

#SBATCH --partition=gpu
#SBATCH --gres=gpu:1
#SBATCH --mem-per-cpu 8000 
#SBATCH --time=00:01:00

#SBATCH --output=slurm-motioncor2-%j.out

module purge
module load cuda/11.2

OUTDIR=Output

mkdir ${OUTDIR}

MotionCor2_1.4.4_Cuda112-08-11-2021 \
-InEer EER/ \
-FmIntFile motioncor-frames.txt \
-OutMrc ${OUTDIR}/ \
-LogFile ${OUTDIR}/ \
-Gain 20210917_110020_EER_GainReference.mrc \
-Kv 300 -PixSize 1.8897 -Throw 0 -OutStack 1 -Patch 5 5 -Iter 10 -Tol 0.5 -Serial 1 -SumRange 0 0 -FmRef 1 -Gpu 0
