FROM resin/rpi-raspbian:jessie

MAINTAINER Ken Martin <ken@kpmartin.com>

USER root

RUN apt-get update
RUN apt-get install -y mpd mpc icecast2 darkice

# ADD https://archive.org/download/Frank_Sinatra_Tape_5_1955-1969/Frank_Sinatra_Tape_5_1955-1969_Side_A.mp3 sinatra_test_stream.mp3