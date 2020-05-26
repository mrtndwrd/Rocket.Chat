#!/bin/bash

version=$(git rev-parse --short HEAD)
meteor npm install
meteor build --server-only --directory /tmp/build-pr
cd /tmp/build-pr
cp /home/maarten/projects/github/rocketchat/.docker/Dockerfile .
sudo docker build -t openappstack/openappstack/rocketchat:openappstack-release-$version .
