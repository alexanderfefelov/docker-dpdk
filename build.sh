#!/usr/bin/env bash

# Elevate privileges
[ $UID -eq 0 ] || exec sudo --preserve-env=DPDK_VERSION bash "$0" "$@"

. settings.sh

readonly TAG=$IMAGE_NAME:$DPDK_VERSION

echo DPDK version: $DPDK_VERSION
echo Tag: $TAG

set -e

docker build \
  --build-arg DPDK_VERSION \
  --tag $TAG \
  .
