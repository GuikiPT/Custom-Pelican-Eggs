#!/bin/bash

docker build \
  -t ghcr.io/guikipt/custom-pelican-eggs:nodejs24_playright \
  -f Dockerfile .
