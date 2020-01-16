FROM ubuntu:14.04

#Install all required libraries
RUN apt-get update -y && apt-get upgrade -y && apt-get install -y apt-utils nano && apt-get install -y build-essential libreadline6 libreadline6-dev libxp6 libxp-dev libgtk2.0-0 libgtk2.0-dev libpawlib-lesstif3-dev libncurses5-dev 

RUN apt-get install -y wget

# Download latest version of radware and then unzip it
RUN wget ftp://radware.phy.ornl.gov/pub/radware/unix/current.tgz && tar xvzf current.tgz

# Copy our Makefile (`Makefile_radware`) into `rw05/src`
COPY /Makefile_radware /rw05/src/Makefile

# Copy in data for analysis
COPY /data /root/data

# Change working directory
WORKDIR /rw05/src

# Install radware
RUN make all && make install

# Copy our custom bashrc_radware file into the container directory
COPY /bashrc_radware /root/bashrc_radware

# Add a line to run the commands contained within `bashrc_radware` as per step 6) of Linux/Unix README
RUN echo 'source ~/bashrc_radware' >> ~/.bashrc

# Starts a bash terminal (as opposed to one in some other shell)
ENTRYPOINT /bin/bash



