#!/bin/bash
# (C) 2020 Benjamin Steenkamer.
# Calculates the checksum/hashes of all the files in a folder and then generates a
# Markdown-style table of the results. The results are outputed into `output.md`.
#
# TODO:
# Specify the folder to hash
# Specify output file name: -o "file_name"
# Specify file filter (only hash these files): -f "*.iso|*.bin"
# Hash files in sub-folders

output_name="output.md"
files=$(ls -1 | sort -V)

printf "Creating hash table...\n"

> $output_name
printf "| File| Size (B) | CRC-32 | SHA-256 |\n" >> $output_name
printf "|---|---|---|---|\n" >> $output_name

while read file; do
    size=$(du -b "$file" | awk '{print $1}')
    printf "Hashing $file...\n"
    crc=$(crc32 "$file")
    sha=$(sha256sum "$file" | awk '{print $1}')
    printf "| $file | $size | \`$crc\`  | \`$sha\` |\n" >> $output_name
done <<< $files
printf "Done.\n"
