
FROM jupyter/scipy-notebook
MAINTAINER ""

USER root
RUN apt-get update && apt-get install -y python-dev libmysqlclient-dev

COPY ./requirements.txt /tmp/requirements.txt
RUN pip install -r /tmp/requirements.txt

