#!/bin/bash
# (C) 2020 - 2023 Benjamin Steenkamer
# Convert .pdf to .png and then back to .pdf.
# Try to  maintain good quality in the process (increase the density if results are not good enough).
# Useful for removing hyperlinks and searchable text in PDFs.

mkdir -p p2p2p-temp

# density = PNG dots-per-inch (DPI)
echo "Converting PDF to PNGs..."
convert -density 300 "$1" p2p2p-temp/page.png

echo "Converting PNGs to PDF..."
# Get PNG names by numeric order
convert $(ls -1 p2p2p-temp/*.png | sort -V) "${1%.pdf}-converted.pdf"
rm -r p2p2p-temp
echo "Done"
