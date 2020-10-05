FROM python:3.8
COPY ./django_blog/ /home
WORKDIR /home 
RUN cp -r wsgi.py  Blog/
RUN apt update -y && apt upgrade -y
RUN apt install  python3 python3-venv git vim net-tools  -y
RUN pip3 install virtualenv  
ENV VIRTUAL_ENV=/home/.env
RUN python3 -m venv $VIRTUAL_ENV
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

#RUN virtualenv Blog 
#CMD ["source", "./Blog/bin/activate"]
#RUN ls -la Blog/bin/activate
RUN pip3 install -r requirements.txt
#RUN python3 manage.py makemigrations 
#RUN python3 manage.py collectstatic
#RUN python3 manage.py migrate
#RUN ls -la 
#RUN python3 manage.py runserver 0.0.0.0:8000
#CMD  ["cd /home/", "python3", "manage.py", "runserver", "0.0.0.0:8000"]
