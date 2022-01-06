FROM ubuntu:18.04
RUN apt update -y
RUN apt install vim wget sudo gnupg gnupg2 gnupg1 ufw -y
RUN echo "nameserver 8.8.8.8" >> /etc/resolv.conf
RUN wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
RUN sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
RUN sudo apt install jenkins
RUN sudo apt install default-jre
RUN service jenkins start
RUN sudo ufw allow 8080
WORKDIR /var/lib/jenkins/secrets/
