all: help

help:	## Show this help
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

build:	## Build all docker images
	docker build -t mbentley/context-root-example:router -f Dockerfile.router .
	docker build -t mbentley/context-root-example:v1 -f Dockerfile.v1 .
	docker build -t mbentley/context-root-example:v2 -f Dockerfile.v2 .
	docker build -t mbentley/context-root-example:v3 -f Dockerfile.v3 .

up:	## Build and run example application
up: build run

run:	## Run example application
	docker-compose up -d

down:	## Stop example application
	docker-compose down -v

.PHONY: all help build up run
