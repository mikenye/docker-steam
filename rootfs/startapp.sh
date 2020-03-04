#!/bin/bash

export HOME=/steam
#export STEAM_RUNTIME_PREFER_HOST_LIBRARIES=0
export LD_LIBRARY_PATH="/steam/xdg/data/Steam/ubuntu12_32"
#export LD_PRELOAD=/usr/lib32/libudev.so.1 
#export STEAM_RUNTIME=0 
exec steam
#exec xterm

