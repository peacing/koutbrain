#!/usr/bin/env bash

CLUSTER_NAME = $1

peg ${CLUSTER_NAME} hadoop start &
peg ${CLUSTER_NAME} spark start