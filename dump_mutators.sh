#!/bin/bash
set -e
mkdir -p resources
cd resources

mkdir -p mutators/System
# mkdir -p mutators/Music
# mkdir -p mutators/Sounds
# mkdir -p mutators/Textures
# mkdir -p mutators/Maps

mkdir -p ../build/mutators/System

# https://ut99.org/viewtopic.php?t=15699
mkdir -p unpack/fnn
wget https://ut99.org/download/file.php?id=21798 -O unpack/fnn.zip
unzip unpack/fnn.zip -d unpack/fnn
mv unpack/fnn/* ../build/mutators/System

# AMD64
sed -i 's/^ServerActors=UWeb.WebServer/&\nServerActors=fnn262.NewNetServer/' ../build/inis/System64/UnrealTournament.ini
sed -i 's/^ServerPackages=TSkMSkins/&\nServerPackages=fnn262/' ../build/inis/System64/UnrealTournament.ini
# AMD64 END

# https://ut99.org/viewtopic.php?t=15881
wget https://ut99.org/download/file.php?id=21041 -O unpack/classicscoreboard.zip 
mkdir -p unpack/classicscoreboard
unzip unpack/classicscoreboard.zip -d unpack/classicscoreboard
mv unpack/classicscoreboard/* ../build/mutators/System

# AMD64
sed -i 's/^ServerActors=UWeb.WebServer/&\nServerActors=csb12.ClassicActor/' ../build/inis/System64/UnrealTournament.ini
sed -i 's/^ServerPackages=TSkMSkins/&\nServerPackages=csb12/' ../build/inis/System64/UnrealTournament.ini
# AMD64 END

# # https://ut99.org/viewtopic.php?t=15633
# wget https://github.com/Deaod/VoteSys/releases/download/v11b/VoteSys_v11b.zip -O unpack/votesys.zip
# mkdir unpack/votesys
# unzip unpack/votesys.zip -d unpack/votesys
# mv unpack/votesys/System/* mutators/System