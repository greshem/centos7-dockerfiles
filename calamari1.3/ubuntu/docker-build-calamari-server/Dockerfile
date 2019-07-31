FROM ubuntu:14.04
ENV DEBIAN_FRONTEND noninteractive

# build dependencies
RUN apt-get update \
  && apt-get install -y git build-essential python-virtualenv git python-dev swig libzmq-dev g++ python-cairo make devscripts libpq-dev cython debhelper python-mock python-configobj cdbs python-sphinx libcairo2-dev python-m2crypto python-crypto reprepro python-support

WORKDIR /tmp

# build from source
RUN git clone https://github.com/ceph/calamari.git \
  && git clone https://github.com/ceph/Diamond.git --branch=calamari

RUN cd Diamond \
  && make deb \
  && cd ../calamari/repobuild \
  && make trusty \
  && cd .. \
  && make dpkg \
  && cd .. \
  && mv calamari-server_*.deb calamari-server.deb

# fix wrong package name in control file
RUN dpkg-deb -x calamari-server.deb calamari-server_deb \
  && dpkg-deb --control calamari-server.deb calamari-server_deb/DEBIAN \
  && sed -i s/python-msgpack-python/python-msgpack/g calamari-server_deb/DEBIAN/control \
  && dpkg-deb -b calamari-server_deb calamari-server.deb

# install dependencies
RUN echo deb http://ppa.launchpad.net/saltstack/salt/ubuntu `lsb_release -sc` main \
    > /etc/apt/sources.list.d/saltstack.list \
  && curl "http://keyserver.ubuntu.com:11371/pks/lookup?op=get&search=0x4759FA960E27C0A6" | apt-key add - \
  && apt-get update && sudo apt-get install -y apache2 libapache2-mod-wsgi libcairo2 supervisor python-cairo libpq5 postgresql salt-master salt-minion python-gevent python-msgpack python-twisted python-txamqp python-zope.interface python-sqlalchemy

RUN dpkg -i calamari-server.deb
