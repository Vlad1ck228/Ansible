FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
sudo apt install -y python3 python3-pip 
sudo apt-add-repository -y ppa:ansible/ansible
sudo apt update
sudo apt install -y ansible 
