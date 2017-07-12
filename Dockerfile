FROM ubuntu:16.04
EXPOSE 8000
RUN apt-get update && apt-get upgrade -y
RUN apt-get install bash-completion libpq-dev python-dev python-dev build-essential -y
RUN apt-get install -y libncurses5-dev libxml2-dev libxslt1-dev wget nano vim
RUN wget https://bootstrap.pypa.io/get-pip.py
RUN python get-pip.py && pip install --upgrade pip && pip install --no-cache-dir virtualenv
RUN apt-get install -y postgresql-9.5 postgresql-contrib-9.5 postgis postgresql-9.5-postgis-2.2
RUN apt-get install -y erlang && apt-get install -y rabbitmq-server
RUN systemctl enable rabbitmq-server && systemctl start rabbitmq-server && systemctl status rabbitmq-server
RUN rabbitmq-plugins enable rabbitmq_management && rabbitmqctl add_user flyersconcierge ZXCflight && rabbitmqctl set_user_tags flyersconcierge administrator && rabbitmqctl set_permissions -p / flyersconcierge ".*" ".*" ".*"
CMD /bin/bash
