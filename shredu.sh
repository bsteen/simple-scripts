#!/bin/bash
# Overwrites the specified file(s) with 3 passes of random data, 
# a final 4th pass of all zeros, and then removes the file(s).
# Output is set to verbose to show all steps.
shred -vzun 3 "$@"
