#!/bin/bash
# (C) 2020 Benjamin Steenkamer.
# Combine the audio stream of file 1 with the video stream of file 2.
# Conversion stops when the shorter of the two sources ends.
# Pass -r to re-encode the audio from file 1 (use this if there is an unsupported codec error).
# ./avcomb.sh [-r] audio_source video_source
if [ "$1" == "-r" ]; then
	ffmpeg -i "$2" -i "$3" -shortest -c:v copy -c:a aac output.mp4
else
	ffmpeg -i "$1" -i "$2" -shortest -c copy -map 0:a:0 -map 1:v:0 output.mp4
fi
