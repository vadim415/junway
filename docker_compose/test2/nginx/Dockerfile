FROM centos:8
RUN dnf update -y && dnf upgrade -y
RUN dnf install nginx -y
COPY nginx.conf /etc/nginx/nginx.conf
#COPY django.conf  /etc/nginx/conf.d/django.conf
RUN ln -sf /dev/stdout /var/log/nginx/access.log \
        && ln -sf /dev/stderr /var/log/nginx/error.log
#RUN  echo 
EXPOSE 80 
#STOPSIGNAL SIGTERM
CMD ["nginx", "-g", "daemon off;"]
#CMD ["nginx"]
