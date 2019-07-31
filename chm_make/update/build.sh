
cp  /root/bin/template_HHC_v2.pl  ./
cp  /root/bin/template_HHK_v2.pl  ./
cp  /root/bin/template_HPP_v2.pl  ./


docker  build -t  chm_make:v2   -f Dockerfile.update  ./

