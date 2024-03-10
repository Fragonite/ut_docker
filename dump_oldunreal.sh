#!/bin/bash
# https://github.com/OldUnreal/UnrealTournamentPatches/releases
# wget https://github.com/OldUnreal/UnrealTournamentPatches/releases/download/v469d/OldUnreal-UTPatch469d-Linux-arm64.tar.bz2 -O OldUnreal.tar.bz2
wget https://github.com/OldUnreal/UnrealTournamentPatches/releases/download/v469d/OldUnreal-UTPatch469d-Linux-amd64.tar.bz2 -O OldUnreal.tar.bz2
mkdir tmp-oldunreal
mkdir tmp-oldunreal/oldunreal
mkdir tmp/oldunreal
tar -xvf OldUnreal.tar.bz2 -C tmp-oldunreal/oldunreal
mv tmtmp-oldunrealp/oldunreal .