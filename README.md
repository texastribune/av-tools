# av-tools
tools for audio, video, podcasting

## livestream-to-mp3.sh

To use this first copy the `intro.wav` file to the current directory. Then grab the URL to the video file. This can be obtained on livestream.com from the share button underneath the video. Then run it like so:

    ./livestream-to-mp3.sh <video url>

For example:

    ./livestream-to-mp3.sh http://livestream.com/texastribune/events/4773607/videos/111858691

It will run for a while and if it all works you should have an `output.mp3` that has the intro appended to the front of the audio from the video.
