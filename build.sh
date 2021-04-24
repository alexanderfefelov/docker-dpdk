#!/usr/bin/env bash

# Elevate privileges
[ $UID -eq 0 ] || exec sudo --preserve-env=UBUNTU_VERSION --preserve-env=DPDK_VERSION bash "$0" "$@"

. settings.sh

readonly TAG=$IMAGE_NAME:dpdk-$DPDK_VERSION-ubuntu-$UBUNTU_VERSION

echo Ubuntu version: $UBUNTU_VERSION
echo DPDK version: $DPDK_VERSION
echo Tag: $TAG

set -e

docker build \
  --build-arg UBUNTU_VERSION \
  --build-arg DPDK_VERSION \
  --tag $TAG \
  .
