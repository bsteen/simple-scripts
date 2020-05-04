#!/bin/bash
# (C) 2020 Benjamin Steenkamer.
# Convert .djvu to .pdf
input="$1"
output="output.pdf"

# quality=jpeg image quality
# -mode=black for black and white only
$ddjvu -format=pdf -quality=90 -verbose $input $output
