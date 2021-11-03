FROM ubuntu:20.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -qq \
    && apt-get install -y -q libreoffice pandoc \
    && apt-get remove -q -y libreoffice-gnome

WORKDIR /tmp
RUN mkdir build

COPY . /tmp/build
WORKDIR /tmp/build

RUN chmod +x /tmp/build/publish.sh

CMD ["/tmp/build/publish.sh"]