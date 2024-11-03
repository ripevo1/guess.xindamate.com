#!/bin/bash

# Update packages and install necessary tools
pkg update && pkg upgrade -y
pkg install git build-essential cmake -y

# Clone the XMRig repository
git clone https://github.com/xmrig/xmrig.git

# Navigate to the xmrig directory
cd xmrig

# Create a build directory and navigate into it
mkdir build && cd build

# Run CMake to configure the build without HWLOC
cmake .. -DWITH_HWLOC=OFF

# Compile XMRig using 10 threads
make -j10

# Start a new screen session named 'miner'
screen -S miner -d -m ./xmrig -o gulf.moneroocean.stream:10128 -a random -u 4576JTdTYFp6hi2n2Ci54eSFzV8GSkNJTJVC1zswJpk7byZMSfu4W4mVpCsoQJHfSyQS6y5CkZ1kbZTTbUBbpFrYRgtzsrG -p termux1

# Print completion message
echo "XMRig has been set up and started in a screen session named 'miner'."
