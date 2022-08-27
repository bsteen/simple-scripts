#!/bin/bash
# (C) 2020 Benjamin Steenkamer.
# Combine multiple .pdf files into a single .pdf.
# Usage: ./pdfcombine.sh input1.pdf input2.pdf...
# Remove spaces from the input file names before combining.
# TODO: Get files names with spaces to work.

pdftk $* cat output output.pdf verbose
