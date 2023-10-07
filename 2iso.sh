#!/bin/bash
# (C) 2023 Benjamin Steenkamer.
# Converts a single file or folder into a `.iso` file.
# Output `.iso` will be saved to current working folder.
# The output `.iso` file name will be the base input folder or input file name
# with the original extension stripped off.
path=$1
base=$(basename $path)
iso_name=${base%.*}".iso"
mkisofs -input-charset utf-8 -o $iso_name $path
if [ $? == 0 ]; then
    printf "\nISO created: $(pwd)/$iso_name\n"
fi
