#!bin/sh

set -eu

CONTAINERNAME="back-app"
IMAGENAME="localdev/docker-nest-app"

if docker compose ps ${CONTAINERNAME} | grep -q running; then
  cmd="docker compose down"
  echo $cmd
  $cmd

  cmd="docker image rm ${IMAGENAME}"
  echo $cmd
  $cmd
else
  if docker images | grep -q ${IMAGENAME}; then
    cmd="docker image rm ${IMAGENAME}"
    echo $cmd
    $cmd
  fi

  cmd="docker compose -f docker-compose.dev.yml up -d"
  echo $cmd
  $cmd
fi
