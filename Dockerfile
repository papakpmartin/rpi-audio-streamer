FROM resin/rpi-raspbian:jessie

MAINTAINER Ken Martin <ken@kpmartin.com>

USER root

RUN sudo apt-get install -y mpd mpc icecast2 darkice