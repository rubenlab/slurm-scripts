#!/bin/bash -l
#SBATCH -D ./ 
#SBATCH -J MotionCor2
#SBATCH -C scratch 
#SBATCH --partition=gpu
#SBATCH --gres=gpu:1
#SBATCH --time=02:00:00 
#SBATCH -o motioncor2-%j.out 
#SBATCH -e motioncor2-%j.err 


# SETUP OF SOFTWARE ENVIRONMENT
module purge
module load cuda/11.2 

# Create output directory for MotionCor2 files
INEERS="frames/*.eer"
OUTDIR="Motioncor2"
LOGDIR="${OUTDIR}/Logs"
GAINFILE="20230320_094613_EER_GainReference.mrc"
FRAMEFILE="frames.txt"

mkdir -p ${LOGDIR}

# Run MotionCor2 (needs to be in your $PATH!)
for fn in ${INEERS} ; do
  stem_movie=$(basename ${fn} | rev | cut -d. -f2- | rev)
  cor_mic="${OUTDIR}/${stem_movie}_mic.mrc"

  MotionCor2_1.6.3_Cuda112_Feb18_2023 \
    -InEer $fn \
    -FmIntFile ${FRAMEFILE} \
    -OutMrc $cor_mic \
    -LogDir ${LOGDIR}/ \
    -Gain ${GAINFILE} \
    -Kv 300 -PixSize 1.89 -Throw 0 -OutStack 1 -Patch 5 5 -Iter 10 -Tol 0.5 -Serial 0 -EerSampling 1 -SumRange 0 0 -reffrm 1 -SplitSum 1 -FmRef 1 -Gpu 0 2> /dev/null

done

