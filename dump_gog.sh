#!/bin/bash
# Make sure you have the GOG installer in the ./resources folder

set -e
mkdir -p resources
cd resources

innoextract setup_ut_goty_2.0.0.5.exe
mkdir -p ../build/core
mv app/Music ../build/core
mv app/Sounds ../build/core
mv app/Textures ../build/core
mv app/Maps ../build/core