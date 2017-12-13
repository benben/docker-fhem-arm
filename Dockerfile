FROM debian:jessie-slim
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update
RUN apt-get -y --force-yes install curl \
libclass-isa-perl \
libcommon-sense-perl \
libdpkg-perl \
liberror-perl \
libfile-copy-recursive-perl \
libfile-fcntllock-perl \
libio-socket-ip-perl \
libio-socket-multicast-perl \
libjson-perl \
libjson-xs-perl \
libmail-sendmail-perl \
libsocket-perl \
libswitch-perl \
libsys-hostname-long-perl \
libterm-readkey-perl \
libterm-readline-perl-perl \
libxml-simple-perl \
libcrypt-pbkdf2-perl \
libcpan-meta-yaml-perl \
build-essential \
libdevice-serialport-perl \
sqlite3 \
libdbd-sqlite3-perl \
libtext-diff-perl \
usbutils
RUN cpan install Net::MQTT:Simple
RUN curl -O http://fhem.de/fhem-5.8.deb && dpkg -i fhem-5.8.deb
EXPOSE 8083
WORKDIR /opt/fhem
# make fhem run in foreground
RUN echo 'attr global nofork 1\n' >> fhem.cfg
ENTRYPOINT ["perl", "fhem.pl", "fhem.cfg"]
