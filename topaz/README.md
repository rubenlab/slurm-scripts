# Topaz

## Usage

The executable script is located in:

/usr/users/rubsak/sw/topaz/topaz.sh

Here's the totorial to topaz:

https://github.com/tbepler/topaz/blob/master/tutorial/01_quick_start_guide.ipynb

## Example

/usr/users/rubsak/sw/topaz/topaz.sh preprocess -v -s 8 -o data/EMPIAR-10025/processed/micrographs/ data/EMPIAR-10025/rawdata/micrographs/*.mrc

## Submission script

To speed up execution, topaz need to use one gpu, so we need to submit the topaz job to a gpu partition.

Example:

[example.sh](./example.sh)
