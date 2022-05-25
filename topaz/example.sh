#SBATCH -p gpu
#SBATCH -C scratch
#SBATCH -t 10:00:00
#SBATCH -G 1

/usr/users/rubsak/sw/topaz/topaz.sh preprocess -v -s 8 -o /scratch1/projects/rubsak/${USER}/myproject/topaz_output /scratch1/projects/rubsak/${USER}/myproject/frames/*.mrc