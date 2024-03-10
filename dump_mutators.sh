#!/bin/bash
mkdir mutators
mkdir mutators/System
mkdir mutators/Music
mkdir mutators/Sounds
mkdir mutators/Textures
mkdir mutators/Maps
mkdir unpack

# Run after update_ini.sh

mkdir -p resources
cd resources

mkdir -p ../build/mutators/System

# https://ut99.org/viewtopic.php?t=15699
wget https://ut99.org/download/file.php?id=21798 -O unpack/fnn.zip
mkdir -p unpack/fnn
unzip unpack/fnn.zip -d unpack/fnn
mv unpack/fnn/* ../build/mutators/System

sed -i 's/^ServerActors=UWeb.WebServer/&\nServerActors=fnn262.NewNetServer/' ../inis/System64/UnrealTournament.ini
sed -i 's/^ServerPackages=TSkMSkins/&\nServerPackages=fnn262/' ../inis/System64/UnrealTournament.ini

# https://ut99.org/viewtopic.php?t=15881
wget https://ut99.org/download/file.php?id=21041 -O unpack/classicscoreboard.zip 
mkdir unpack/classicscoreboard
unzip unpack/classicscoreboard.zip -d unpack/classicscoreboard
mv unpack/classicscoreboard/* ../build/mutators/System

sed -i 's/^ServerActors=UWeb.WebServer/&\nServerActors=csb12.ClassicActor/' ../inis/System64/UnrealTournament.ini
sed -i 's/^ServerPackages=TSkMSkins/&\nServerPackages=csb12/' ../inis/System64/UnrealTournament.ini

# # https://ut99.org/viewtopic.php?t=15633
# wget https://github.com/Deaod/VoteSys/releases/download/v11b/VoteSys_v11b.zip -O unpack/votesys.zip
# mkdir unpack/votesys
# unzip unpack/votesys.zip -d unpack/votesys
# mv unpack/votesys/System/* mutators/System