FROM ubuntu:18.04

ARG DPDK_VERSION
ARG DPDK_STUFF=dpdk-$DPDK_VERSION.tar.xz
ARG DPDK_HOME=/dpdk

RUN apt-get -qq update \
  && apt-get -qq install --no-install-recommends \
       build-essential \
       ca-certificates \
       libnuma-dev \
       python3-pip \
       python3-setuptools \
       wget \
       xz-utils \
  && pip3 install \
       meson \
       ninja \
  && wget --quiet http://fast.dpdk.org/rel/$DPDK_STUFF \
  && mkdir --parents $DPDK_HOME \
  && tar --extract --file=$DPDK_STUFF --directory=$DPDK_HOME --strip-components 1 \
  && apt-get -qq clean \
  && rm --recursive --force /var/lib/apt/lists/* /tmp/* /var/tmp/* \
  && rm --force $DPDK_STUFF

RUN cd $DPDK_HOME \
  && meson build \
  && cd build \
  && ninja \
  && ninja install \
  && ldconfig

ENV RTE_SDK=$DPDK_HOME
