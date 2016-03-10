FROM mhart/alpine-node:latest

MAINTAINER Paulo Pires @paulohp

# Install base packages
RUN apk update
RUN apk upgrade
RUN apk add --update curl wget bash

# # Install ruby and ruby-bundler
# RUN apk add ruby ruby-bundler

# Clean APK cache
RUN rm -rf /var/cache/apk/*

RUN \
  npm install -g grunt-cli && \
  npm install -g bower

RUN rm -rf /tmp/**

COPY package.json /tmp/package.json
COPY .npmrc /tmp/.npmrc

RUN cd /tmp && npm install
