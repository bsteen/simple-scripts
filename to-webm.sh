#!/bin/bash
# (C) 2020 Benjamin Steenkamer
#
# Converts a video container file (e.g. .mp4) to .webm format.
# It re-encodes the video to VP9 and audio to Opus using the two-pass,
# constant quality method.
# You can uncomment the faster, single-pass method if you prefer
# "The CRF value can be from 0–63. Lower values mean better quality. Recommended
# values range from 15–35, with 31 being recommended for 1080p HD video."
# See: https://trac.ffmpeg.org/wiki/Encode/VP9

if [ $# -eq 0 ]; then
    printf "Usage: ./to-webm file_name.mp4 [crf=30]\n"
fi
if [ $2 ]; then
    crf=$2
else
    crf=30
fi

# Two-pass, constant quality method (recommended)
ffmpeg -i "$1" -c:v libvpx-vp9 -b:v 0 -crf $crf -pass 1 -an -f null /dev/null && \
ffmpeg -i "$1" -c:v libvpx-vp9 -b:v 0 -crf $crf -pass 2 -c:a libopus output.webm

# Simple-pass, constant quality method (faster, less efficient compression)
# ffmpeg -i "$1" -c:v libvpx-vp9 -crf $crf -b:v 0 -c:a libopus output.webm
