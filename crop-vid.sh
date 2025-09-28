#!/bin/bash
# (C) 2025 Benjamin Steenkamer
# Crop a video with a given start and end time

# Print usage
if [ "$1" == "-h" ]; then
    echo "Usage: $0 <video_file> <start_time_HH:MM:SS> <end_time_HH:MM:SS>"
    exit 0
fi

# Get file name
base="${1%.*}"
ext="${1##*.}"
output="${base}_cropped.${ext}"
echo $output

# Crop video
# ffmpeg -i "$1" -ss "$2" -to "$3" -c copy "$output"
