#!/bin/bash
# (C) 2021 Benjamin Steenkamer
#
# Overwrites the specified file(s) with 2 passes of random data,
# a final pass of all zeros, and then removes the file(s).
# Output is set to verbose to show all steps.
shred -vzun 2 "$@"
