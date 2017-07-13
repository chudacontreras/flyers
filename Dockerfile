FROM ubuntu:16.04
MAINTAINER FlyerDefenders and contributors
RUN apt-get update && apt-get upgrade -y
RUN apt-get install bash-completion libpq-dev python-dev python-dev build-essential -y
RUN apt-get install -y libncurses5-dev libxml2-dev libxslt1-dev wget nano vim git git-core 
RUN wget https://bootstrap.pypa.io/get-pip.py
RUN python get-pip.py && pip install --upgrade pip && pip install --no-cache-dir virtualenv
RUN apt-get install -y postgresql-9.5 postgresql-contrib-9.5 postgis postgresql-9.5-postgis-2.2
RUN apt-get install -y erlang && apt-get install -y rabbitmq-server
CMD /bin/bash
