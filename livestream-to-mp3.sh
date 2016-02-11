#!/usr/bin/env bash

# this is quick and dirty; it should probably be refactored if it actually
# gets used

#### prerequisites ####
# install the following:
# pip install youtube-dl
# brew install sox ffmpeg OR apt-get install -y sox ffmpeg

# put the intro file in this directory (named intro.wav)
# add a file called `list.txt` to this directory with these contents:
#
# file './intro.wav'
# file './l2.wav'

# if on trusty need a PPA for ffmpeg:
#apt-get install -y libav-tools
#apt-get install -y python-software-properties
#apt-get install -y software-properties-common
#add-apt-repository -y ppa:mc3man/trusty-media
#apt-get update

set -o nounset
set -o errexit
set -o pipefail
set -o xtrace
set -o allexport

# for example:
#youtube-dl -o livestream.mp4 http://livestream.com/texastribune/events/4027860/videos/87035732
youtube-dl -o livestream.mp4 $1
# convert to audio:
ffmpeg -i livestream.mp4 livestream.wav
# convert the livestream to 44100 sampling rate, 1 channel and 16 bits:
sox livestream.wav -b 16 -c 1 -r 44100 l2.wav
# combine the intro and the livestream:
ffmpeg -f concat -i list.txt -c copy out.wav
# convert the WAV to an mp3:
ffmpeg -i out.wav -f mp3 output.mp3

# log in to SoundCloud with "sc auth" prior to running the script - 1 time

#sc output.mp3

# clean up:
rm livestream.mp4
rm livestream.wav
rm out.wav
#rm output.mp3
