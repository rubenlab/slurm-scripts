# ISONET

## Usage

/usr/users/rubsak/sw/isonet-container/isonet.sh -c ${Config} ${Folder_Path}

isonet.sh will automatically subbmit a slurm job.

${Folder_Path} should be the folder where your mrc files are located.

-c ${Config} is optional, here is the content of the default config file:

```
# deconv=0 means skip deconv step
deconv=1
# mask=0 means skip mask step
mask=1
# extract=0 means skip extract step
extract=1
# refine=0 means skip refine step
refine=1
# predict=0 means skip predict step
predict=1

# pixel_size need to be modified to fit your mrc files.
pixel_size=10.8

# other parameters for training and predicting, usually using the default parameters is good enough.
snrfalloff=1.0
deconvstrength=1.0
iterations=20
noise_start_iter=5,10,15
noise_level=0.05,0.1,0.15
```

The default config file will always be imported, so if you want to only change the pixel_size to 3.6, you need such a config file:

```
pixel_size=3.6
```

## Slurm options

Here's the slurm options used by iosnet.sh:

```
#SBATCH -p gpu
#SBATCH -C scratch
#SBATCH -t 10:00:00
#SBATCH -G 4
```

## Example

[example.sh](./example.sh)