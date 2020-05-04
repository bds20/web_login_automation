FROM ubuntu:latest

MAINTAINER keerthana

WORKDIR /usr/apps/hello-docker/

RUN apt-get -y update

RUN apt-get install -y nodejs

RUN apt-get install -y npm

#RUN ln -s /usr/bin/nodejs /usr/bin/node........;;;;;

RUN npm install -g http-server

ADD . /usr/apps/hello-docker/

ADD index.html /usr/apps/hello-docker/index.html

EXPOSE 7075

CMD ["http-server", "-s"]

HEALTHCHECK CMD curl --fail http://localhost:7075/ || exit 1

