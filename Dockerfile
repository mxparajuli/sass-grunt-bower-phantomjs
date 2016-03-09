FROM nodesource/jessie:4.3.2

MAINTAINER Paulo Pires @paulohp

RUN apt-get update -qq && apt-get install -y build-essential libjpeg-progs ruby-full

RUN \
  npm install -g grunt-cli && \
  npm install -g bower && \
  gem install compass  --no-rdoc --no-ri

ADD package.json /tmp/package.json
ADD .npmrc /tmp/.npmrc

RUN cd /tmp && npm install
