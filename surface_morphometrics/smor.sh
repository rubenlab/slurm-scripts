#!/bin/bash
#SBATCH -p medium
#SBATCH -C scratch
#SBATCH -t 48:00:00
#SBATCH -c 12

module load singularity

image=/usr/users/rubsak/sw/surface_morphometrics/smor.sif
dir=/scratch1/projects/rubsak/Tianhui2/SegmemTV/out3_surface
config=${dir}/config.yml
name="2219nerverwtL2a_ts_004_newstack_full_rec_lbl.labels_ER"

singularity exec -B ${dir} -e --no-home --pwd /opt/surface_morphometrics ${image} \
python3 segmentation_to_meshes.py ${config}

singularity exec -B ${dir} -e --no-home --pwd /opt/surface_morphometrics ${image} \
python3 run_pycurv.py ${config} ${name}_ER.surface.vtp

singularity exec -B ${dir} -e --no-home --pwd /opt/surface_morphometrics ${image} \
python3 measure_distances_orientations.py ${config} ${name}.mrc
