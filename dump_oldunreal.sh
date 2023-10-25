#!/bin/bash
# https://github.com/OldUnreal/UnrealTournamentPatches/releases
wget https://github.com/OldUnreal/UnrealTournamentPatches/releases/download/v469d-rc2/OldUnreal-UTPatch469d-Linux-amd64.tar.bz2
tar -xvf OldUnreal-UTPatch469d-Linux-amd64.tar.bz2 -C tmp/oldunreal
mv tmp/oldunreal .