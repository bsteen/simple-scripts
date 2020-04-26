#!/bin/bash
# Benjamin Steenkamer, 2020.
# Calculates the hash(es) of all the files in a folder and then generates a
# Markdown-style table of the files and hashes. By default, it only generates
# the SHA-256 hashes and outputs them into `output.md`.
# Specify hashes to calculate: ./hash-tbl-md.sh -h hash1 hash2 ...
# Available hashes/checksums: sha256
# TODO:
# Specify the folder to hash
# Specify hashes to calculate: -h hash1 hash2 ...
# Add hashes: md5, crc32, crc64, sha1, sha256, sha512
# Specify output file name: -o "file_name"
# Specify file filter (only hash these files): -f "*.iso|*.bin"
# Hash files in sub-folders

output_name="output.md"
files=$(ls -1 | sort -V)

printf "Creating hash table...\n"

> $output_name
printf "| File | SHA-256 |\n" >> $output_name
printf "|---|---|\n" >> $output_name

while read file; do
    printf "Hashing $file...\n"
    hash=$(sha256sum "$file")
    hash=$(echo $hash | awk '{print $1}')
    printf "| $file | \`$hash\` |\n" >> $output_name
done <<< $files
printf "Done.\n"
