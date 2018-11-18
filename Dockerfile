FROM resin/rpi-raspbian:jessie

MAINTAINER Ken Martin <ken@kpmartin.com>

USER root

RUN apt-get update \
&& apt-get install -y mpd mpc icecast2 darkice

# Add the configuration XML for IceCast, which is the program responsible for
# streaming the audio to end users 
ADD icecast.xml /etc/icecast2/icecast.xml

# Add the conf for the Music Player Daemon so there's an auto-playing stream for testing
ADD mpd.conf /etc/mpd.conf
# Add a file for the mpd auto-playing testing stream
ADD https://archive.org/download/Frank_Sinatra_Tape_5_1955-1969/Frank_Sinatra_Tape_5_1955-1969_Side_A.mp3 /var/lib/mpd/music/

# Add the cfg for Darkice, which will get the audio from the USB audio device and send it to IceCast
ADD darkice.cfg /etc/darkice.cfg

# Replace the darkice init.d script with one fixed per the instructions at
# https://ubuntuforums.org/showthread.php?t=2183222
ADD init_d-darkice /etc/init.d/darkice

# Set up the user for Darkice per https://ubuntuforums.org/showthread.php?t=2183222
RUN adduser nobody audio

RUN update-rc.d -f mpd mpd \
&& update-rc.d mpd defaults \
&& update-rc.d -f darkice remove \
&& update-rc.d darkice defaults 99 \

ENTRYPOINT "/usr/bin/darkice"