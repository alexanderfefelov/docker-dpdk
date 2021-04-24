# docker-dpdk

Build mainstream version (see [`settings.sh`](settings.sh)):

```bash
./build.sh
```

You can specify DPDK version and/or Ubuntu version to build non-mainstream image:

```bash
DPDK_VERSION=18.11.11 UBUNTU_VERSION=18.04 ./build.sh
```
