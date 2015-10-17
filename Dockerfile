FROM frolvlad/alpine-oraclejdk8
MAINTAINER Rafael Cortês <rafael.cortes@tecnico.ulisboa.pt>

RUN apk add --update bash \
  python \
  py-pip \
  && rm -rf /var/cache/apk/*

RUN pip install -U docker-compose
