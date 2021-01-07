#!/usr/bin/env bash

container="golang-remote-debug"
image="sw-samuraj/golang-remote-debug"

echo "Starting container ${container} with image ${image}..."

docker run --rm --net=host --name "${container}" "${image}"
