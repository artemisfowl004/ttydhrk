FROM ubuntu:20.04
RUN mkdir ./app
RUN chmod 777 ./app
WORKDIR /app

RUN apt -qq update

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Kolkata

RUN apt -qq install -y git aria2 wget curl busybox unzip unrar tar tmux tmate

COPY . .

RUN wget https://github.com/tsl0922/ttyd/releases/download/1.6.3/ttyd.x86_64
RUN chmod +x ttyd.x86_64
CMD ./ttyd.x86_64 -p $PORT -c admin:admin bash 
