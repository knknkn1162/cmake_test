FROM ubuntu:20.04
ENV DEBIAN_FRONTEND=nointeractive
RUN apt-get update && \
  apt-get install -y cmake build-essential rsync git
