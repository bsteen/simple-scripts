#!/bin/bash
# (C) 2020 Benjamin Steenkamer.
# Combine the audio stream of video 1 with the video stream of video 2.
# Stop the conversion when the shorter of the two sources ends.
ffmpeg -i $1 -i $2 -shortest -c copy -map 0:a:0 -map 1:v:0 output.mp4
