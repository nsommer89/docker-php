DOCKER_USERNAME ?= nsommer89
APPLICATION_NAME ?= php
DOCKER_FILE ?= nginx.Dockerfile
VERSION ?= 8.3

build:
	docker build -t ${DOCKER_USERNAME}/${APPLICATION_NAME} -f ${DOCKER_FILE} .
tag:
	docker tag ${DOCKER_USERNAME}/${APPLICATION_NAME} ${DOCKER_USERNAME}/${APPLICATION_NAME}:${VERSION}
push:
	docker push ${DOCKER_USERNAME}/${APPLICATION_NAME}
# make latest versions of php, nginx and build container
base:
	make build DOCKER_FILE=base.Dockerfile APPLICATION_NAME=base VERSION=8.3
php:
	make build DOCKER_FILE=php.Dockerfile APPLICATION_NAME=php VERSION=8.3
nginx:
	make build DOCKER_FILE=nginx.Dockerfile APPLICATION_NAME=nginx VERSION=8.3
# build code container
code:
	make build DOCKER_FILE=code.Dockerfile APPLICATION_NAME=code VERSION=8.3

