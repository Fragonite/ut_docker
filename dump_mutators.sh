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

sed -i 's/^ServerActors=UWeb.WebServer/&\nServerActors=fnn262.NewNetServer/' ../build/inis/System/UnrealTournament.ini
sed -i 's/^ServerPackages=TSkMSkins/&\nServerPackages=fnn262/' ../build/inis/System/UnrealTournament.ini
sed -i 's/^ServerPackages=TSkMSkins/&\nServerPackages=BP1H262/' ../build/inis/System/UnrealTournament.ini
sed -i 's/^ServerPackages=TSkMSkins/&\nServerPackages=BP4H262/' ../build/inis/System/UnrealTournament.ini

# sed -i 's/^ServerPackages=TSkMSkins/&\nServerPackages=multimesh/' ../build/inis/System/UnrealTournament.ini
# sed -i 's/^ServerPackages=TSkMSkins/&\nServerPackages=EpicCustomModels/' ../build/inis/System/UnrealTournament.ini
# sed -i 's/^ServerPackages=TSkMSkins/&\nServerPackages=TCowMeshSkins/' ../build/inis/System/UnrealTournament.ini
# sed -i 's/^ServerPackages=TSkMSkins/&\nServerPackages=TNaliMeshSkins/' ../build/inis/System/UnrealTournament.ini
# sed -i 's/^ServerPackages=TSkMSkins/&\nServerPackages=TSkMSkins/' ../build/inis/System/UnrealTournament.ini
sed -i 's/^ServerPackages=TSkMSkins/&\nServerPackages=SkeletalChars/' ../build/inis/System/UnrealTournament.ini

cat << EOF > ../build/inis/System/FragNewNet.ini
[fnn262.UnlimitedAmmo]
RedeemerUnlimited=False

[fnn262.GiveWeapons]
bDoubleEnforcer=True
bGiveAllWeapons=True
bGiveRedeemer=False
bGiveTranslocator=False
GiveMaxAmmo=199

[fnn262.NoItemsMap]
bNoAllWeapons=True
bNoRedeemer=False
bNoAmmo=True
bNoInvisibility=False
bNoAmplifier=False
bNoShieldbelt=False
bNoArmor=False
bNoThighPads=False
bNoBigKegOHealth=False
bNoMedBoxes=False
bNoVials=False
bNoJumpBoots=False

[fnn262.UTPure]
HammerDamagePri=60.000000
HammerDamageSec=20.000000
HammerDamageSelfPri=36.000000
HammerDamageSelfSec=24.000000
EnforcerDamage=17.000000
BioDamagePri=40.000000
BioDamageSec=75.000000
BioDamageCharging=150.000000
BioDamageCharged=300.000000
ShockDamagePri=40.000000
ShockDamageSec=55.000000
ShockDamageCombo=165.000000
PulseDamagePri=20.000000
PulseDamageSec=4.000000
RipperDamagePri=30.000000
RipperDamageSec=34.000000
MinigunDamagePri=9.000000
MinigunDamageSec=14.000000
FlakDamagePri=16.000000
FlakDamageSec=70.000000
RocketDamagePri=75.000000
RocketDamageSec=80.000000
SniperDamagePri=40.000000
SniperHeadshotDamage=100.000000
H4xDamagePri=45.000000
H4xHeadshotDamage=100.000000
H4xSpeed=1.000000
HookDamageMode0=1.000000
HookDamageMode1=13.000000
ComboGibDamagePri=700.000000
ComboGibDamageSec=700.000000
ComboGibDamageCombo=700.000000
ComboDamageType=ShockCombo
bNNAnnouncer=True
bAnnouncerForSpecs=True
bDMPlayerCount=False
bTeamPlayerCount=False
bHUDCTF4=False
bHUDMultiCTF=False
bDoubleEnforcers=True
bBrightPlayer=True
bSpecBehindView=True
bShowCarcass=True
bShootCarcass=True
bBunnyHopping=True
bSmoothFOVChanges=False
bRedeemerControls=False
PlayerPacks[0]=BP1
PlayerPacks[1]=BP4
PlayerPacks[2]=
bForceDefaultHitSounds=False
DefaultHitSound=2
DefaultTeamHitSound=3
bAdvancedTeamSay=False
bAutoPause=False
MinClientRate=50000
MaxClientRate=50000
bUseOldLogo=False
EOF

# https://ut99.org/viewtopic.php?t=15881
wget https://ut99.org/download/file.php?id=21041 -O unpack/classicscoreboard.zip 
mkdir -p unpack/classicscoreboard
unzip unpack/classicscoreboard.zip -d unpack/classicscoreboard
mv unpack/classicscoreboard/* ../build/mutators/System

sed -i 's/^ServerActors=UWeb.WebServer/&\nServerActors=csb12.ClassicActor/' ../build/inis/System/UnrealTournament.ini
sed -i 's/^ServerPackages=TSkMSkins/&\nServerPackages=csb12/' ../build/inis/System/UnrealTournament.ini

# # https://ut99.org/viewtopic.php?t=15633
# wget https://github.com/Deaod/VoteSys/releases/download/v11b/VoteSys_v11b.zip -O unpack/votesys.zip
# mkdir unpack/votesys
# unzip unpack/votesys.zip -d unpack/votesys
# mv unpack/votesys/System/* mutators/System

# Bonus Pack 4
wget https://unrealarchivesgp.blob.core.windows.net/files/patches-updates/Unreal%20Tournament/Bonus%20Packs/utbonuspack4-zip.zip -O unpack/utbonuspack4.zip
mkdir -p unpack/utbonuspack4
unzip unpack/utbonuspack4.zip -d unpack/utbonuspack4
# mv unpack/utbonuspack4/* ../build/mutators
rsync -a unpack/utbonuspack4/* ../build/mutators

# XServerQuery
wget https://ut99.org/download/file.php?id=16058 -O unpack/xserverquery.zip
mkdir -p unpack/xserverquery
unzip unpack/xserverquery.zip -d unpack/xserverquery
mv unpack/xserverquery/XServerQuery.u ../build/mutators/System

sed -i 's/^ServerActors=IpServer.UdpServerQuery/ServerActors=XServerQuery.XServerQuery/' ../build/inis/System/UnrealTournament.ini
sed -i 's/^ServerActors=IpServer.UdpServerUplink/ServerActors=XServerQuery.XServerUplink/g' ../build/inis/System/UnrealTournament.ini

# ServerUtils
mv ../ServerUtils/ServerUtils.u ../build/mutators/System
sed -i 's/^ServerActors=UWeb.WebServer/&\nServerActors=ServerUtils.ServerUtils/' ../build/inis/System/UnrealTournament.ini
sed -i 's/^ServerPackages=TSkMSkins/&\nServerPackages=ServerUtils/' ../build/inis/System/UnrealTournament.ini