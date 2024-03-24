#!/bin/bash
#SBATCH -p gpu
#SBATCH -C scratch
#SBATCH -t 10:00:00
#SBATCH -G 1

# load tomodrgn
source /usr/users/rubsak/sw/tomodrgn/load_tomodrgn.bash

# run tomodrgn unit test
# tomodrgn codes are under /usr/users/rubsak/sw/tomodrgn folder
python /usr/users/rubsak/sw/tomodrgn/testing/unittest.py