#!/bin/bash

# コンテナを起動する
sudo podman run --privileged -itd --name=plugsched \
    -v /work:/work \
    -v /work5:/work5 \
    -v /usr/src/kernels:/usr/src/kernels \
    -v /usr/lib/debug/lib/modules:/usr/lib/debug/lib/modules \
    plugsched_host1:latest

# コンテナ内でコマンドを実行する
sudo podman exec -it plugsched /bin/bash -c "\
plugsched-cli build /work5/scheduler && \
cp /work5/scheduler/working/rpmbuild/RPMS/x86_64/scheduler-xxx-5.10.23-200.fc33.yyy.x86_64.rpm /work5/scheduler-xxx.rpm"

sudo rpm -ivh /work5/scheduler-xxx.rpm

sudo insmod /run/plugsched/scheduler.ko