#!/bin/bash
# Benjamin Steenkamer, 2020.
# Convert a compatible video container file to .avi while trying to maintain good quality.
# Codec info: https://trac.ffmpeg.org/wiki/Encode/H.264

# Preset is the encoding speed to compression ratio (quality/file size). Slower means better results, but longer time spent.
preset="slower"		# medium (default), slow, slower, veryslow

# CRF 0 to 51 (23 is default): Lossless 0 ... [23] ... 51 Worst
crf=18

# Remove the file extension from the file name
avi=$(echo $1 | awk 'BEGIN{FS=OFS="."} NF--')

# Check if file already exists
if test -f $avi.avi; then
	read -p "$avi.avi already exists. Do you want to overwrite it? y/[n] " answer
	if [ $answer != "y" ]; then
		echo "Did not convert to .avi"
		exit 0
	fi
fi

echo "Converting $1 to AVI..."
ffmpeg -y -i $1 -c:v libx264 -preset $preset -crf $crf -c:a copy $avi.avi > /dev/null 2>&1
echo "Converted to AVI: $avi.avi"
