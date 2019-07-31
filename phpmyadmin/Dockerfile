#FROM centos:centos7
FROM  greshem/greshem_scm_base_common


RUN yum -y install httpd php php-mysql php-gd openssl psmisc tar phpmyadmin php-mbstring    &&\
    yum clean all
RUN yum install -y  php-php-gettext

ADD scripts /scripts 
RUN chmod 755 /scripts/*   &&  chown -R apache:apache /var/www/  &&  chown -R  apache:apache /usr/share/phpMyAdmin/
#RUN mkdir  /var/lib/php/session/ 
RUN chown -R apache:apache   /var/lib/php/session/


ADD phpMyAdmin.conf   /etc/httpd/conf.d/phpMyAdmin.conf

#session. I my case I soved this to change the owner to apache: sudo chown -R apache:apache /var/ww 


##https://wordpress.org/wordpress-4.8.6.tar.gz
## http://wordpress.org/latest.tar.gz                         
#RUN curl -LO http://wordpress.org/wordpress-4.8.6.tar.gz                &&\
#    tar xvzf /wordpress-4.8.6.tar.gz -C /var/www/html --strip-components=1       &&\
#    chown -R apache:apache /var/www/                                    &&\
#    chmod 755 /scripts/*
USER 0
EXPOSE 80
CMD ["/bin/bash", "/scripts/start.sh"]
