FROM debian:wheezy
MAINTAINER Patrcik Cantu < cantu 'at' whycantu.com >

ENV DEBIAN_FRONTEND noninteractive
ENV LANG en_US.UTF-8

RUN apt-get -qq update; \
apt-get -qqy dist-upgrade ; \
apt-get -qqy --no-install-recommends install locales python-dev python-pip ipython \
sudo procps ca-certificates wget pwgen supervisor; \
echo 'en_US.ISO-8859-15 ISO-8859-15'>>/etc/locale.gen ; \
echo 'en_US ISO-8859-1'>>/etc/locale.gen ; \
echo 'en_US.UTF-8 UTF-8'>>/etc/locale.gen ; \
locale-gen ; \
apt-get -y autoremove ; \
apt-get clean ; \
rm -Rf /var/lib/apt/lists/*

RUN apt-get update
RUN apt-get install build-essential -y
RUN pip install requests
RUN pip install pubnub
RUN pip install ringcentral
CMD ["/bin/bash"]
