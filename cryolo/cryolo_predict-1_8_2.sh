#!/bin/bash -l
#SBATCH -D ./
#SBATCH -J crYOLO
#SBATCH -C scratch

#SBATCH --partition=gpu
#SBATCH --gres=gpu:1
#SBATCH --time=02:00:00

#SBATCH -o slurm-cryolo-%j.out
#SBATCH -e slurm-cryolo-%j.err

unset ${!SLURM_@}
module purge
module load cuda/10.2.89

source /usr/users/rubsak/sw/conda/conda_rubsak.bash cryolo-1.8.2

module list
echo "Conda environment: $(basename $CONDA_DEFAULT_ENV)"

'/usr/users/rubsak/sw/conda/cryolo-1.8.2/bin/python3.7' -u '/usr/users/rubsak/sw/conda/cryolo-1.8.2/bin/cryolo_gui.py' --ignore-gooey predict -c '/scratch1/projects/rubsak/tapu/Cryolo/Arsen/config_cryolo.json' -w '/scratch1/projects/rubsak/tapu/Cryolo/Arsen/cryolo_model.h5' -i /scratch1/projects/rubsak/tapu/Cryolo/Arsen/Input -o 'Output' -t '0.3' -d '0' -pbs '3' --gpu_fraction '1.0' -nc '-1' --norm_margin '0.0' --filament -bd '10' -sm 'LINE_STRAIGHTNESS' -st '0.95' -sr '1.41' -ad '10' --directional_method 'PREDICTED' -mw '100' --tomogram -tsr '-1' -tmem '0' -mn3d '2' -tmin '5' -twin '-1' -tedge '0.4' -tmerge '0.8'

