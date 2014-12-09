FROM centos:centos6

MAINTAINER yudai-ez "https://github.com/yudai-ez/ansible-centos6.git"

RUN rpm -ivh http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
RUN yum update -y
RUN yum install -y ansible tar gcc-c++
