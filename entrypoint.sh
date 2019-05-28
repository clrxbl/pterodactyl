#!/bin/bash
cd /home/container

# Make internal Docker IP address available to processes.
export INTERNAL_IP=`ip route get 1 | awk '{print $NF;exit}'`

# Replace Startup Variables
MODIFIED_STARTUP=`eval echo $(echo ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')`
echo "OpenJDK Runtime Environment (build 1.8.0_212-b03)"
echo "Eclipse OpenJ9 VM (build openj9-0.14.0, JRE 1.8.0 Linux amd64-64-Bit Compressed References 20190417_286 (JIT enabled, AOT enabled)"
echo "OpenJ9   - bad1d4d06"
echo "OMR      - 4a4278e6"
echo "JCL      - 5590c4f818 based on jdk8u212-b03)"
echo "---"
echo "AdoptOpenJDK 8 (OpenJ9) + glibc"
echo "https://eth0.co"
echo "---"
echo ":/home/container$ ${MODIFIED_STARTUP}"

# Run the Server
eval ${MODIFIED_STARTUP}
