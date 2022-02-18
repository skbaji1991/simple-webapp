FROM centos

WORKDIR /opt/

RUN     sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-Linux-* && \
        sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-Linux-* 

RUN	yum update -y 
RUN	yum install -y python3 && \
	yum install -y epel-release && \
	yum install -y python3-pip 

RUN	yum install -y mysql

RUN     pip3 install flask && \
        pip3 install flask-mysql

COPY ./simple-webapp/app.py /opt/
COPY ./script.sh /opt/
RUN chmod +x /opt/script.sh
ENTRYPOINT ./script.sh ; /bin/bash 
