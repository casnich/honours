FROM ubuntu:14.04

RUN apt-get update -y && apt-get upgrade -y && apt-get install -y apt-utils nano && apt-get install -y build-essential libreadline6 libreadline6-dev libxp6 libxp-dev libgtk2.0-0 libgtk2.0-dev libpawlib-lesstif3-dev libncurses5-dev 