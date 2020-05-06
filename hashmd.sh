#!/bin/bash
# (C) 2020 Benjamin Steenkamer.
# Calculates the checksum/hashes of all the files in a folder and then generates a
# Markdown-style table of the results. The results are outputted into `output.md`.
#
# TODO:
# Specify the folder to hash
# Specify output file name: -o "file_name"
# Specify file filter (only hash these files): -f "*.iso|*.bin"

output_name="output.md"

# Specify base folder
# ./script -d "a\b\c"
# dir="."
# dir=$1
# ls "$dir"

if [ "$1" == "-r" ]; then
    # Find all files and directories recursively and cut of leading "./"
    files=$(find . | sort -f | cut -c 3-)
else
    # List files and directories only in base directory
    files=$(ls -1 | sort -f)
fi

> $output_name      # Create/clear output file
printf "| File| Size (B) | CRC-32 | SHA-256 |\n" >> $output_name
printf "|---|---|---|---|\n" >> $output_name

while read file; do
    # If it is actually a file (and not a directory), hash it
    if [[ -f $file ]]; then
        printf "Hashing $file...\n"
        size=$(du -b "$file" | awk '{print $1}')
        crc=$(crc32 "$file")
        sha=$(sha256sum "$file" | awk '{print $1}')
        printf "| $file | $size | \`$crc\`  | \`$sha\` |\n" >> $output_name
    fi
done <<< $files
printf "Done.\n"
