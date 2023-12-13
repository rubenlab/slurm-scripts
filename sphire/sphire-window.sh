#!/bin/bash 
#SBATCH -D ./
#SBATCH -J sp_window
#SBATCH -C scratch

#SBATCH --partition=medium
#SBATCH --mem-per-cpu 6000 
#SBATCH -n 16
#SBATCH --time=10:00:00

#SBATCH -o slurm-window-%j.out
#SBATCH -e slurm-window-%j.err

module purge
module load openmpi/4.1.1

#source ~/bin/rubsak.bashrc
#use_sphire
source /usr/users/rubsak/sw/conda/conda_rubsak.bash eman-2.31

module list
#echo "Conda evironment: $(basename $CONDA_DEFAULT_ENV)"

mpirun -np 16 sp_window.py 'Micrographs/*.mrc' 'Cryolo/Renamed/*.box' 'STAR2SPHIRE/Links/Micrographs/sphire_cter_partres.txt' 'Window' --coordinates_format='cryolo_helical_segmented' --box_size=768 --filament_width=256

