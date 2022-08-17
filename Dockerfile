FROM ubuntu:20.04
RUN apt update \ 
    apt install default-jdk -y \ 
    apt install maven -y \ 
    apt install git -y \ 
    apt install docker.io -y
WORKDIR /opt/app
COPY Dockerfile.inside /opt/Dockerfile