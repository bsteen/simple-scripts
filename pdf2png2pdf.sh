#!/bin/bash
# Benjamin Steenkamer, 2020.
# Convert .pdf to .png and then back to .pdf.
# Try to  maintain good quaility in the process (increase density if bad).
# Useful for deactivating links in the .pdf.

mkdir -p p2p2p-temp

# density = PNG dots-per-inch (DPI)
echo "Converting PDF to PNGs..."
convert -density 300 "$1" p2p2p-temp/temp.png

echo "Converting PNGs to PDF..."
# Get PNG names by numeric order
convert $(ls -1 p2p2p-temp/*.png | sort -V) $1-converted.pdf
rm -rf p2p2p-temp
echo "Done."
