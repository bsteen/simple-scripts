#!/bin/bash
# (C) 2023 Benjamin Steenkamer
# Convert `.pdf` to a set of `.png`s
# Try to maintain good quality in the process (increase the density if results are not good enough)
convert -alpha remove -density 300 $1 "${1%.*}.png"
