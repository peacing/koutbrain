#!/usr/bin/env bash

set -eu

# source address file with node public DNS
. ~/address.sh

ssh -i ~/.ssh/psingman.pem ubuntu@$master_pubdns <<- 'ENDSSH'

    # Log in to the server.  This can be done only once.
    wget --save-cookies cookies.txt \
         --keep-session-cookies \
         --post-data 'userName=$1&Password=$2' \
         --delete-after \
         https://www.kaggle.com/account/login

    # Now grab the page or pages we care about.
    wget --load-cookies cookies.txt \
         https://www.kaggle.com/c/outbrain-click-prediction/download/page_views.csv.zip

    # Unzip the file and place onto HDFS
    gunzip -c page_views.csv.zip | hadoop fs -put - /tmp/page_views_sample.csv


 ENDSSH