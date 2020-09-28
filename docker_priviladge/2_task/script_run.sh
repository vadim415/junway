#!/bin/bash
docker build -f Dockerfile  -t dind_v1:tag1 .; 
# В этом шаге я собираю так называемый dind  docker in docker там инструкций не много но лучше свой
docker run -it -v /var/run/docker.sock:/var/run/docker.sock   --privileged dind_v1:tag1 bash

#В том шаге я запускаю собранный dind  с оболочкой bash ,могу на alpine  сути особо не меняет (но с полными правами и привелигиями а также прокидывания сокетов  /var/run/docker.sock and /var/lib/docker/ ) 
#После того как я собрал это все захожу в свою рабочую директорию и начинаю новый билд уже с неё собственно и запускаю этот билд с приложением сонованным на pyrhon 3 web_server, блин можно было wp | но сории от него тошнит...... / даже готовый плейбук на установку есть
docker build -f Dockerfiledind  -t v1:tag1 .;

#Дальше запустилил смотрим все ли ок, / дальше запускаем наш Dockerfile
docker run -d v1:tag1
# docker ps / видим оба процесса






