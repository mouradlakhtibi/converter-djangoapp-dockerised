FROM  ubuntu:latest
WORKDIR /app

COPY . /app
RUN apt-get  update
RUN apt-get install -y  python3-pip
RUN pip3 install  virtualenv
RUN virtualenv  -p  python3  env
#RUN source env/bin/activate

RUN pip3  install -r requirements.txt
RUN  python3 manage.py migrate


EXPOSE 8000:8000

ENTRYPOINT [ "python3","manage.py","runserver" ] 


