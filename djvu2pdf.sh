#!/bin/bash
# Benjamin Steenkamer, 2020.
# Convert .djvu to .pdf
input="$1"
output="output.pdf"

# quality=jpeg image quality
# -mode=black for black and white only
$ddjvu -format=pdf -quality=90 -verbose $input $output
