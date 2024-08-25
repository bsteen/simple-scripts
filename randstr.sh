#!/bin/bash
# (C) 2020 - 2024 Benjamin Steenkamer
# Get 128 btyes of random data from /dev/urandom and return visible ASCII characters only
# Passing `-a` makes only alpha-numeric characters be returned

if [ "$1" = "-a" ]; then
	# Delete the complement of set 1: only have letters
	head -c 128 /dev/urandom | tr -dc [:alnum:]
else
	# Delete the complement of set 1: only have visible ASCII characters
	head -c 128 /dev/urandom | tr -dc [:graph:]
fi
echo
