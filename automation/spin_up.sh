#!/usr/bin/env bash

CLUSTER_NAME = $1

peg up $peg/master.yml &
peg up peg/workers.yml &

wait

peg fetch ${CLUSTER_NAME}

peg install ${CLUSTER_NAME} ssh
peg install ${CLUSTER_NAME} aws
peg install ${CLUSTER_NAME} hadoop
peg install ${CLUSTER_NAME} spark
