#!/bin/bash
# (C) 2022-2023 Benjamin Steenkamer
#
# Overwrites the specified file(s) with 1 pass of random data,
# a final pass of all zeros, and then removes the file(s).
# Output is set to verbose to show all steps.
shred -vzun 1 "$@"
