#!/bin/bash
# (C) 2020 - 2023, 2025 Benjamin Steenkamer
# Convert .pdf to .png and then back to .pdf.
# Try to  maintain good quality in the process (increase the density if results are not good enough).
# Useful for removing hyperlinks and searchable text in PDFs.

TEMP_DIR=$(mktemp -d)

# density = PNG dots-per-inch (DPI)
echo "Converting PDF to PNGs..."
convert -density 300 "$1" ${TEMP_DIR}/page.png

echo "Converting PNGs to PDF..."
# Get PNG names by numeric order
convert $(ls -1 ${TEMP_DIR}/*.png | sort -V) "${1%.pdf}-converted.pdf"
rm -rf ${TEMP_DIR}
echo "Done"
