FROM centos:7 
MAINTAINER Sebastien Viardot <Sebastien.Viardot@grenoble-inp.fr>

#Install pandoc and latex package
COPY install.sh /tmp
RUN yum install -y wget unzip java-11-openjdk-devel.x86_64 make python38
RUN useradd -ms /bin/bash rnuser
USER rnuser
RUN /tmp/install.sh

