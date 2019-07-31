#!/bin/sh
export  LC_ALL="en_US.UTF-8" 
/etc/init.d/mysqld  start 
/etc/init.d/httpd   start 

sleep 60000 
