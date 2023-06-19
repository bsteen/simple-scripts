#!/bin/bash
# (C) 2022 - 2023 Benjamin Steenkamer.
# Check if the calculated SHA256 sum of file equals the provided SHA256 sum string.
# This saves you the time of making a formatted file with the sum and filename.
if [ -z $1 ] || [ -z $2 ]; then
	echo "Usage: $0 <file> <SHA-256-str>"
else
	echo "$2 $1" | sha256sum --check
fi
