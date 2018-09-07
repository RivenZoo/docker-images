#!/usr/bin/env bash


APP_REDIS=redisdb

function usage {
	echo "redis.sh server [port] [data_dir]"
	echo "redis.sh client [port]"
	echo "default: port=6379 data_dir=/tmp/redis"
}

function run_client {
	port=$1
	if [[ -z "${port}" ]]; then
		port=6379
	fi
	
	docker run -it --link ${APP_REDIS}:redis --rm redis redis-cli -h redis -p ${port}
}

function run_redis_server {
	port=$1
	if [[ -z "${port}" ]]; then
		port=6379
	fi
	data_dir=$2
	if [[ -z "${data_dir}" ]]; then
		data_dir=/tmp/redis
		mkdir -p ${data_dir}
	fi
	docker run --name ${APP_REDIS} -d redis redis-server --appendonly yes -v ${data_dir}:/data
}

case $1 in
	server) shift; run_redis_server $*;;
	client) shift; run_client $*;;
esac