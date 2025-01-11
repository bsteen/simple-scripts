#!/bin/bash
# (C) 2020 - 2025 Benjamin Steenkamer
# Get 128 bytes of random data from `/dev/urandom` and print visible ASCII characters only
# Passing `-a` makes only alpha-numeric characters print
# Passing `-A` makes only alpha-numeric characters print, excluding O0lI

if [ "$1" = "-a" ]; then
	# Delete the complement of set 1: only have letters
	head -c 128 /dev/urandom | tr -dc [:alnum:]
elif [ "$1" = "-A" ]; then
	# Same as above, but also delete O, 0, l, and I which can be confusing with certain fonts
	head -c 128 /dev/urandom | tr -dc [:alnum:] | tr -d O0lI
else
	# Delete the complement of set 1: only have visible ASCII characters
	head -c 128 /dev/urandom | tr -dc [:graph:]
fi
echo
