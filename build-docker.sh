#!/usr/bin/env bash

app="remote-debug"

if [[ ! -e "${app}" ]]; then
  echo "${app} binary not found, building the app..."
  go build
fi

tag="sw-samuraj/golang-remote-debug"

echo "Building the image: ${tag}"

docker build -t "${tag}" -f Dockerfile .
