FROM centos
MAINTAINER Joel Handwell "joelhandwell@gmail.com"

RUN yum install openssh openssh-server sed vim-minimal -y
RUN sed -ri 's/#UsePAM no/UsePAM no/g' /etc/ssh/sshd_config
RUN echo 'root:root' |chpasswd
RUN /usr/bin/ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -C '' -N ''
RUN /usr/bin/ssh-keygen -t rsa -f /etc/ssh/ssh_host_dsa_key -C '' -N ''
EXPOSE 22
CMD /usr/sbin/sshd -D
