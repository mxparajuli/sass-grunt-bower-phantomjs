FROM mhart/alpine-node:4.4

MAINTAINER Paulo Pires @paulohp

# Install base packages
RUN apk update
RUN apk upgrade
RUN apk add curl wget bash

# Install ruby and ruby-bundler
RUN apk add ruby ruby-bundler

# Clean APK cache
RUN rm -rf /var/cache/apk/*

RUN \
  npm install -g grunt-cli && \
  npm install -g bower && \
  gem install compass  --no-rdoc --no-ri

ADD package.json /tmp/package.json
ADD .npmrc /tmp/.npmrc

RUN cd /tmp && npm install
