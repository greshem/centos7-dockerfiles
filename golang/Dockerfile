#FROM centos:7
FROM  greshem/greshem_scm_base_common

RUN yum -y update && yum clean all

#yum install -y centos-release-scl && \
RUN mkdir -p /go && chmod -R 777 /go && \
    yum -y install git go-toolset-7-golang && yum clean all

ENV GOPATH=/go \
    BASH_ENV=/opt/rh/go-toolset-7/enable \
    ENV=/opt/rh/go-toolset-7/enable \
    PROMPT_COMMAND=". /opt/rh/go-toolset-7/enable"

WORKDIR /go
