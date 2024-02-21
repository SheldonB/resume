FROM ubuntu:20.04

ENV DEBIAN_FRONTEND noninteractive

WORKDIR /tmp

RUN apt-get update -qq \
    && apt-get install -y -q pandoc wget

RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN apt install -y -q ./google-chrome-stable_current_amd64.deb

RUN mkdir build

COPY . /tmp/build
WORKDIR /tmp/build

RUN chmod +x /tmp/build/publish.sh

CMD ["/tmp/build/publish.sh"]