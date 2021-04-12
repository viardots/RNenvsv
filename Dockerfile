FROM centos 
MAINTAINER Sebastien Viardot <Sebastien.Viardot@grenoble-inp.fr>

#Install pandoc and latex package
COPY install.sh /tmp
RUN /tmp/install.sh
