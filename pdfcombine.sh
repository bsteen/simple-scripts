#!/bin/bash
# Benjamin Steenkamer, 2020.
# Combine multiple .pdf files into a single .pdf.
# Usage: ./pdfcombine.sh input1.pdf input2.pdf...
# Remove spaces from the input file names before combining.

pdftk $* cat output output.pdf
