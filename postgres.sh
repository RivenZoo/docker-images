#!/bin/bash

APP_POSTGRES = postgresdb

function run_psql {
	user=$1
	dbname=$2
	port=$3
	if [[ -z "${user}" ]]; then
		user=postgres
	fi
	if [[ -z "${port}" ]]; then
		port=5432
	fi
	if [[ -z "${dbname}" ]]; then
		dbname=postgres
	fi
	docker run -it --rm --link ${APP_POSTGRES}:postgresdb postgres psql -h postgresdb -U ${user} -p ${port} -d ${dbname}
}

function run_postgres {
	if [[ -z "${port}" ]]; then
		port=5432
	fi
	if [[ -z "${password}" ]]; then
		password=king+5688
	fi
	docker run --name ${APP_POSTGRES} -p 5432:${port} -e POSTGRES_PASSWORD=${password} -d postgres 
}

case $1 in
	-server) shift; run_postgres $*;;
	-psql=*) shift; run_psql $*;;
esac