#!/bin/bash -l
#SBATCH -D ./
#SBATCH -J AreTomo
#SBATCH -C scratch

#SBATCH --partition=gpu
#SBATCH --gres=gpu:1
#SBATCH --mem-per-cpu 8000 
#SBATCH --time=00:10:00

#SBATCH --output slurm-aretomo-%j.out
#SBATCH -e slurm-aretomo-%j.err


module purge
module load cuda/10.2  # The CUDA version number here (10.2) must correspond to the number in the executable below (102)
module list

OUTDIR=Output

mkdir -v ${OUTDIR}

# The number in the executable here (102) must correspond to the module version number above (10.2) 
AreTomo_1.2.0_Cuda102_06-23-2022 \
-InMrc micrograph_stack.mrc \
-OutMrc ${OUTDIR}/reconstruction.mrc \
-AngFile stack.rawtlt \
-OutBin 8 -TiltCor 1 -Wbp 1 -VolZ 1600 -AlignZ 1000 -FlipVol 1 -Patch 0 0 0 0 -PixSize -1.00 -OutXF 1 -Gpu 0

