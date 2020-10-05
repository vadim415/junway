FROM python:3.8
COPY ./django_blog/ /home
WORKDIR /home 
RUN cp -r wsgi.py  Blog/
RUN apt update -y && apt upgrade -y
RUN apt install  python3 python3-venv git vim net-tools  -y
RUN pip3 install virtualenv  
RUN virtualenv Blog 
CMD ["source Blog/bin/activate"
#RUN pip3 install -r requirements.txt
#RUN python3 manage.py makemigrations 
