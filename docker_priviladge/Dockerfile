#FROM debian:9
FROM docker:dind
#RUN apk update -y && apk upgrade -y
#RUN apt install apt-transport-https ca-certificates curl gnupg2 software-properties-common -y  && curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - && add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" && apt update -y && apt install docker-ce -y
COPY ./Dockerfiledind /home/Dockerfiledind
COPY ./web.py /home 
WORKDIR /home
#RUN /etc/init.d/docker start &&  
RUN docker build -f /home/Dockerfiledind -t test1:v9 . 
RUN  docker run -d --privileged   test1:v9
#VOLUME /var/lib/docker
#EXPOSE 2375

