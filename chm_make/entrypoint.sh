#!/bin/sh



cd /html/

perl ~/bin/template_HHC_v2.pl 
perl ~/bin/template_HHK_v2.pl
perl ~/bin/template_HPP_v2.pl 

wine  hhc.exe HTML.hpp

