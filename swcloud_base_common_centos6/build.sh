#!/bin/sh
set -x 
docker build -t  greshem_scm_base_common:centos6   ./
docker tag   greshem_scm_base_common:centos6   greshem/greshem_scm_base_common:centos6
docker push  greshem/greshem_scm_base_common:centos6
