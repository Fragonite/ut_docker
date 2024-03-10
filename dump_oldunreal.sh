#!/bin/bash

set -e
mkdir -p resources
cd resources

# https://github.com/OldUnreal/UnrealTournamentPatches/releases

# AMD64
wget https://github.com/OldUnreal/UnrealTournamentPatches/releases/download/v469d/OldUnreal-UTPatch469d-Linux-amd64.tar.bz2 -O OldUnreal.tar.bz2
# AMD64 END

# ARM
# wget https://github.com/OldUnreal/UnrealTournamentPatches/releases/download/v469d/OldUnreal-UTPatch469d-Linux-arm64.tar.bz2 -O OldUnreal.tar.bz2
# ARM END

mkdir -p tmp-oldunreal/oldunreal
tar -xvf OldUnreal.tar.bz2 -C tmp-oldunreal/oldunreal
mv tmp-oldunreal/oldunreal ../build/

# AMD64
mkdir -p ../build/inis/System64
cp ../build/oldunreal/System64/Default.ini ../build/inis/System64/UnrealTournament.ini
cp ../build/oldunreal/System64/DefUser.ini ../build/inis/System64/User.ini
# AMD64 END

# ARM
# mkdir -p ../build/inis/SystemARM64
# cp ../build/oldunreal/SystemARM64/Default.ini ../build/inis/SystemARM64/UnrealTournament.ini
# cp ../build/oldunreal/SystemARM64/DefUser.ini ../build/inis/SystemARM64/User.ini
# ARM END