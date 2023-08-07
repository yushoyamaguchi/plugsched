# Copyright 2019-2022 Alibaba Group Holding Limited.
# SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
From openanolis/anolisos:latest

RUN yum install epel-release -y
RUN yum install gcc-8.5.0-10.1.0.3.an8 --allowerasing -y
RUN yum install gcc-c++-8.5.0-10.1.0.3.an8 --allowerasing -y
RUN yum install gcc-plugin-devel-8.5.0-10.1.0.3.an8 --allowerasing -y
RUN yum install libstdc++-static-8.5.0-10.1.0.3.an8 --allowerasing -y
RUN yum install python3 python3-pip python3-pyyaml libyaml-devel -y
RUN pip3 install --user sh docopt colorlog
RUN yum install make bison flex \
                systemd git \
                elfutils-libelf-devel openssl openssl-devel \
                elfutils-devel-static \
                glibc-static zlib-static \
                platform-python-devel dwarves \
                rpm-build rsync bc perl -y && \
    yum install gcc-python-plugin-0.17-1.4.an8 --allowerasing --enablerepo=Plus -y && \
    yum clean all

COPY . /usr/local/lib/plugsched/
RUN ln -s /usr/local/lib/plugsched/cli.py /usr/local/bin/plugsched-cli
