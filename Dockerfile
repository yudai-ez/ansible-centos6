FROM centos:centos6

MAINTAINER yudai-ez "https://github.com/yudai-ez/ansible-centos6.git"

RUN rpm -ivh http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
RUN yum update -y
RUN yum install -y ansible
RUN yum install -y tar       
RUN yum install -y gcc-c++
RUN yum install -y autoconf
RUN yum install -y automake
RUN yum install -y passwd
RUN yum install -y openssh
RUN yum install -y openssh-server
RUN yum install -y openssh-clients
RUN yum install -y sudo

RUN useradd ciuser
RUN passwd -f -u ciuser
RUN mkdir -p /home/ciuser/.ssh; chown ciuser /home/ciuser/.ssh; chmod 700 /home/ciuser/.ssh
ADD authorized_keys /home/ciuser/.ssh/
RUN chown ciuser /home/ciuser/.ssh/authorized_keys; chmod 600 /home/ciuser/.ssh/authorized_keys

RUN echo "ciuser    ALL=(ALL)       ALL" >> /etc/sudoers.d/ciuser

RUN sed -i -e "s:^UsePAM yes$:#UsePAM yes:" /etc/ssh/sshd_config
RUN /etc/init.d/sshd start
RUN /etc/init.d/sshd stop
