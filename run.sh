#!/bin/bash

docker run --rm -u $(id -u):$(id -g) --gpus all -p 8888:8888 -v $(pwd):/tf/project rl-replays-gpu
