#!/bin/bash

set -e
mkdir -p resources
cd resources

# https://github.com/OldUnreal/UnrealTournamentPatches/releases
# wget https://github.com/OldUnreal/UnrealTournamentPatches/releases/download/v469d/OldUnreal-UTPatch469d-Linux-arm64.tar.bz2 -O OldUnreal.tar.bz2
wget https://github.com/OldUnreal/UnrealTournamentPatches/releases/download/v469d/OldUnreal-UTPatch469d-Linux-amd64.tar.bz2 -O OldUnreal.tar.bz2
mkdir -p tmp-oldunreal/oldunreal
tar -xvf OldUnreal.tar.bz2 -C tmp-oldunreal/oldunreal
mv tmp-oldunreal/oldunreal ../build/
mkdir -p ../build/inis/System64
cp ../build/oldunreal/System64/Default.ini ../build/inis/System64/UnrealTournament.ini
cp ../build/oldunreal/System64/DefUser.ini ../build/inis/System64/User.ini