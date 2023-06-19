#!/bin/bash
# (C) 2020 - 2023 Benjamin Steenkamer
# Get 128 btyes of random data from /dev/urandom and return visible ASCII characters only.
# Passing `-a` makes only letters (upper and lower) be retuned.
if [ "$1" = "-a" ]; then
	# Delete the complement of set 1: only have letters
	head -c 128 /dev/urandom | tr -dc [:alpha:]
else
	# Delete the complement of set 1: only have visible ASCII characters
	head -c 128 /dev/urandom | tr -dc [:graph:]
fi
echo
