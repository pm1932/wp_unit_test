#!/bin/bash
HOST_PORT=$1
HOST_NAME=$2

MODE=''

if [ "${HOST_PORT}" = "" ]; then
    HOST_PORT='8083';
fi

if [ "${DB_HOST_PORT}" = "" ]; then
    DB_HOST_PORT='8084';
fi

if [ "${HOST_NAME}" = "" ]; then
    HOST_NAME='cs2_0.pm1932.jp';
fi

DOCKER_DIR=`pwd`
WP_DIR=‘../../app'

cd `dirname $0`
cp docker-compose.template.yml docker-compose.yml

MY_IP=`ipconfig getifaddr en0`

cd ${WP_DIR}
WP_ROOT=`pwd | sed -e 's/\//\\\\\//g'`

cd ${DOCKER_DIR}

sed -i '' "s/%WP_ROOT%/${WP_ROOT}/" docker-compose.yml
sed -i '' "s/%HOST_PORT%/${HOST_PORT}/" docker-compose.yml
sed -i '' "s/%MY_IP%/${MY_IP}/" docker-compose.yml
sed -i '' "s/%DB_HOST_PORT%/${DB_HOST_PORT}/" docker-compose.yml
sed -i '' "s/%HOST_NAME%/${HOST_NAME}/" docker-compose.yml

docker-compose up -d