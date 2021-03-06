FROM mianasbat/ubuntu1804-py3.6-pip:latest
ENV PYTHONUNBUFFERED 1

RUN apt-get update && \
    apt-get -y install sudo


RUN sudo apt-get install tree

RUN DEBIAN_FRONTEND=noninteractivate apt-get install -y mysql-server
RUN sudo apt-get install -y libmysqlclient-dev
RUN sudo apt-get install -y python3-pip 
RUN sudo apt-get install -y python-setuptools 

RUN ln -s /usr/bin/pip3 /usr/bin/pip

RUN pip3 install --upgrade setuptools 
RUN pip3 install --ignore-installed wrapt 
RUN pip3 install -U pip

COPY ./requirements.txt /requirements.txt
RUN pip3 install -r /requirements.txt 

RUN mkdir /vagrant

WORKDIR /vagrant
COPY . /vagrant/

# RUN mkdir -p /vol/web/media
# RUN mkdir -p /vol/web/static
# RUN adduser -D user
# RUN chown -R user:user /vol/
# RUN chmod -R 755 /vol/web
# USER user