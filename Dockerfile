# Copyright 2019-2022 Alibaba Group Holding Limited.
# SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
From openanolis/anolisos:latest

RUN yum install epel-release -y
RUN yum install python3 python3-pip gcc gcc-c++ libyaml-devel -y
RUN pip3 install --user sh docopt pyyaml colorlog
RUN yum install make bison flex \
                gcc-plugin-devel \
                systemd git \
                elfutils-libelf-devel openssl openssl-devel \
                elfutils-devel-static \
                glibc-static zlib-static \
                libstdc++-static \
                platform-python-devel \
                rpm-build rsync bc perl -y && \
    yum install gcc-python-plugin --enablerepo=Plus -y && \
    yum clean all

COPY . /usr/local/lib/plugsched/
RUN ln -s /usr/local/lib/plugsched/cli.py /usr/local/bin/plugsched-cli
