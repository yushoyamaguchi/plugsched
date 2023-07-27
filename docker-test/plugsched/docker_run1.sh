#!/bin/bash

docker run --name plug --privileged -p 8080:8080 -dit plugsched:latest /bin/bash