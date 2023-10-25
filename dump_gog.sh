#!/bin/bash
# Make sure you have the GOG installer in the same directory as this script
innoextract setup_ut_goty_2.0.0.5.exe
mkdir core
mv app/Music core
mv app/Sounds core
mv app/Textures core
mv app/Maps core