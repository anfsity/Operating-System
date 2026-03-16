#!/bin/bash
IMAGE="pkuflyingpig/pintos"

docker run -it --rm \
    -u $(id -u):$(id -g) \
    -v "$(pwd):$(pwd)" \
    -w "$(pwd)" \
    "$IMAGE" bash
