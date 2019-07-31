#FROM  greshem_scm_base_common
#FROM  greshem/greshem_scm_base_common
FROM   greshem/python27_build_env:centos7
MAINTAINER greshem

#RUN yum install -y  gcc   && yum clean all 
#COPY        ./  /tmp/gcc_compiler 

#WORKDIR     /tmp/gcc_compiler
#RUN         echo  after  install start  app

USER 0
#ENTRYPOINT [  "/tmp/gcc_compiler/entrypoint.sh" ] 
CMD ["/bin/bash"]
