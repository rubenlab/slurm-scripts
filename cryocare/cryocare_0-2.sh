#!/bin/bash -l
#SBATCH -D ./
#SBATCH -J cryoCARE
#SBATCH -C scratch

#SBATCH --partition=gpu
#SBATCH --mem-per-cpu 6000 
#SBATCH --gres=gpu:2
#SBATCH --time=05:00:00

#SBATCH -o slurm-cryocare-%j.out
#SBATCH -e slurm-cryocare-%j.err

module purge
module load cuda/10.2.89
#export KERAS_BACKEND=tensorflow  # NEEDED?

source /usr/users/rubsak/sw/conda/conda_rubsak.bash cryocare_0.2_c10_nokeras

module list
echo "Conda environment: $(basename $CONDA_DEFAULT_ENV)"
echo "PYTHONPATH: '$PYTHONPATH'"
echo "PYTHONHOME: '$PYTHONHOME'"
echo

cryoCARE_extract_train_data.py --conf train_data_config.json && \
cryoCARE_train.py --conf train_config.json && \
cryoCARE_predict.py --conf predict_config.json

