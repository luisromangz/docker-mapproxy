#!/bin/bash

cd /tmp
curl $CONFIG_URL > mapproxy.zip
curl $DATASETS_URL > datasets.zip

if [ ! -e "mapproxy.zip" ];
then
    exit 1
fi

if [ ! -e "datasets.zip" ];
then 
    echo "No Datasets file exiting..."
    exit 1
fi

unzip mapproxy.zip

unzip datasets.zip -d datasets
ls -lah  datasets

#mapproxy-util create -t wsgi-app -f mapproxy.yaml app.py
#uwsgi --ini /uwsgi.conf
mapproxy-util serve-develop -b :8080 mapproxy.yaml
