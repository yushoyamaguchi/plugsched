#!/bin/bash

sudo rpm -e scheduler-xxx
sudo podman stop plugsched
sudo podman rm plugsched