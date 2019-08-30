FROM centos


RUN yum -y install git  
RUN yum -y install epel-release
RUN cd /root/
RUN yum -y install python-pip
RUN yum -y install python-pip
RUN yum -y install python-devel
RUN yum -y install gcc

WORKDIR  /root/
RUN git clone  http://192.168.131.75:10080/greshem/dashboard_new.git

WORKDIR  /root/dashboard_new/
RUN cd /root/dashboard_new/
RUN     git pull
RUN     git pull




#COPY   *.tar.gz /root/tar/
COPY  venv_.sh /root/
COPY  requirements.txt  /root/dashboard_new/requirements.txt

RUN pip install    --trusted-host  pypi.douban.com  -i http://pypi.douban.com/simple/   -r requirements.txt   
RUN  mkdir /var/log/httpd/
COPY  settings.py  /root/dashboard_new/dashboard/settings.py
COPY  settings_dashboard.py   /root/dashboard_new/dashboard/local/settings_dashboard.py
