#!/bin/bash

docker build \
  -t guikipt/custom_pelican_eggs:nodejs24_playright \
  -f Dockerfile .
