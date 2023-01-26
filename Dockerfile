FROM gitpod/workspace-full-vnc
MAINTAINER Sebastien Viardot <Sebastien.Viardot@grenoble-inp.fr>

#Install pandoc and latex package
COPY install.sh /tmp
USER root
RUN apt update && apt install -y wget unzip openjdk-11-jdk make python3 git nano 
RUN useradd -ms /bin/bash rnuser
#USER rnuser
RUN bash -c /tmp/install.sh

