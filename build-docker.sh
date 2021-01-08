#!/usr/bin/env bash

app="remote-debug"
debugger="dlv"

# Build the app if binary is not present
if [[ ! -e "${app}" ]]; then
  echo "${app} binary not found, building the app..."
  go build
fi

# Prepare the debugger for Docker
delve=$(which "$debugger")
if [[ -z "${delve}" ]]; then
  echo "${debugger} binary not found, downloading the debugger..."
  go get github.com/go-delve/delve/cmd/dlv
  delve=$(which "$debugger")
fi
mkdir -p bin
cp "${delve}" bin

tag="sw-samuraj/golang-remote-debug"

echo "Building the image: ${tag}"

docker build -t "${tag}" -f Dockerfile .
