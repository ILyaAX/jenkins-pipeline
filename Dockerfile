FROM ubuntu:20.04
ENV TZ=Asia/Novosibirsk
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt update
RUN apt install git -y && apt install default-jdk -y && apt install maven -y \
    && apt install wget -y && apt install docker.io -y
WORKDIR /opt/app
COPY Dockerfile.inside /opt/Dockerfile