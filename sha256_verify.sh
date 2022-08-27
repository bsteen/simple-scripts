#!/bin/bash
# (C) 2022 Benjamin Steenkamer.
# Check if the calculated SHA256 sum of file equals the provided SHA256 sum string.
# This saves you the time of making a formatted file with the sum and filename.
# Usage: ./sha256_verify myfiletocheck.exe d14a028c2a3a2bc9476102bb288234c415a2b01f828ea62ac5b3e42f

echo "$2 $1" | sha256sum --check
