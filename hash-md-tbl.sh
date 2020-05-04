#!/bin/bash
# Benjamin Steenkamer, 2020.
# Calculates the hashes of all the files in a folder and then generates a
# Markdown-style table of the files and hashes. It generates CRC32 and SHA-256
# hashes and outputs them into `output.md`.
#
# TODO:
# Specify the folder to hash
# Add CRC32 and file size (bytes)
# Specify output file name: -o "file_name"
# Specify file filter (only hash these files): -f "*.iso|*.bin"
# Hash files in sub-folders

output_name="output.md"
files=$(ls -1 | sort -V)

printf "Creating hash table...\n"

> $output_name
printf "| File| Size (B) | SHA-256 |\n" >> $output_name
printf "|---|---|---|\n" >> $output_name

while read file; do
    size=$(du -b "$file" | awk '{print $1}')
    printf "Hashing $file...\n"
    hash=$(sha256sum "$file" | awk '{print $1}')
    printf "| $file | $size | \`$hash\` |\n" >> $output_name
done <<< $files
printf "Done.\n"
