FROM ubuntu:22.04
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe

RUN apt-get update && apt-get install -y tzdata
RUN apt-get update
RUN apt-get install -y iputils-ping
RUN apt-get install -y python3 python3-pip 
RUN apt-get install -y ansible
RUN mkdir -p /etc/ansible
RUN apt-get update
RUN apt-get upgrade -y

RUN rm /etc/ansible/ansible.cfg
COPY ansible.cfg /etc/ansible/ansible.cfg
RUN rm /etc/ansible/hosts
RUN rmdir /etc/ansible/roles
RUN mkdir /etc/ansible/hosts
COPY step /etc/ansible/hosts/step
