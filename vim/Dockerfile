# "ported" by Adam Miller <maxamillion@fedoraproject.org> from
#   https://github.com/fedora-cloud/Fedora-Dockerfiles
#
# Originally written for Fedora-Dockerfiles by
#   "Aditya Patawari" <adimania@fedoraproject.org>

#FROM centos:centos7
FROM  greshem/greshem_scm_base_common
MAINTAINER The CentOS Project <cloud-ops@centos.org>

RUN yum -y update; yum clean all
RUN yum -y install vim 
RUN mkdir /src/

ADD root_vim /root/.vim/
ADD .vimrc  /root/.vimrc
WORKDIR /src/

CMD ["/bin/bash"]
