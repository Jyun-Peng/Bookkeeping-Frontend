#!/bin/bash

ROOT_DIR="$(dirname $(dirname $(realpath $0)))"
COMPOSE_YAML="docker/develop.docker-compose.yaml"

cd $ROOT_DIR
docker compose -f $COMPOSE_YAML down