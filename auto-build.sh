#!/bin/bash

BIN_PATH=${1:-"./canary"}
rm -rf ./build
echo "removing build folder"
echo "running build"
mkdir build && cd build

cmake -DCMAKE_TOOLCHAIN_FILE=~/vcpkg/scripts/buildsystems/vcpkg.cmake .. --preset linux-release
cmake --build linux-release

cd ~
cd canary
cp -r build/linux-release/bin/canary .
sudo chmod +x canary
