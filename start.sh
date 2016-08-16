#!/bin/bash

cd /tmp

curl $CONFIG_URL > mapproxy.zip
curl $DATASETS_URL > datasets.zip

unzip mapproxy.zip
ls -lah mapproxy.zip
cat mapproxy.yaml

unzip datasets.zip
ls -lah  datasets

mapproxy-util create -t wsgi-app -f mapproxy.yaml app.py
#uwsgi --ini /uwsgi.conf
mapproxy-util serve-develop -b :8080 mapproxy.yaml
