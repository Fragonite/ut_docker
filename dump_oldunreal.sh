#!/bin/bash

set -e
mkdir -p resources
cd resources

# https://github.com/OldUnreal/UnrealTournamentPatches/releases

# AMD64
if [ ! -f OldUnreal.tar.bz2 ]; then
    wget https://github.com/OldUnreal/UnrealTournamentPatches/releases/download/v469d/OldUnreal-UTPatch469d-Linux-amd64.tar.bz2 -O OldUnreal.tar.bz2
fi 
# AMD64 END

# ARM
# wget https://github.com/OldUnreal/UnrealTournamentPatches/releases/download/v469d/OldUnreal-UTPatch469d-Linux-arm64.tar.bz2 -O OldUnreal.tar.bz2
# ARM END

mkdir -p tmp-oldunreal/oldunreal
tar -xvf OldUnreal.tar.bz2 -C tmp-oldunreal/oldunreal
mv tmp-oldunreal/oldunreal ../build/
mkdir -p ../build/inis/System

# AMD64
cp ../build/oldunreal/System64/Default.ini ../build/inis/System/UnrealTournament.ini
cp ../build/oldunreal/System64/DefUser.ini ../build/inis/System/User.ini
# AMD64 END

# ARM
# cp ../build/oldunreal/SystemARM64/Default.ini ../build/inis/System/UnrealTournament.ini
# cp ../build/oldunreal/SystemARM64/DefUser.ini ../build/inis/System/User.ini
# ARM END