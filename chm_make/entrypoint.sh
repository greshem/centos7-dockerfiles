#!/bin/sh



cd /html/

perl /root/bin/template_HHC_v2.pl 
perl /root/bin/template_HHK_v2.pl
perl /root/bin/template_HPP_v2.pl 

wine  hhc.exe HTML.hpp

