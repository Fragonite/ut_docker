#!/bin/bash
# Run after dump_oldunreal.sh

set -e
mkdir -p resources
cd resources

cp oldunreal/System64/Default.ini ../inis/System64/UnrealTournament.ini
cp oldunreal/System64/DefUser.ini ../inis/System64/User.ini
crudini --set ../inis/System64/UnrealTournament.ini IpDrv.TcpNetDriver MaxClientRate 100000
crudini --set ../inis/System64/UnrealTournament.ini IpDrv.TcpNetDriver NetServerMaxTickRate 100
crudini --set ../inis/System64/UnrealTournament.ini IpDrv.TcpNetDriver LanServerMaxTickRate 100
crudini --set ../inis/System64/UnrealTournament.ini Engine.DemoRecDriver MaxClientRate 100000
crudini --set ../inis/System64/UnrealTournament.ini Engine.DemoRecDriver NetServerMaxTickRate 100
crudini --set ../inis/System64/UnrealTournament.ini Engine.DemoRecDriver LanServerMaxTickRate 100
crudini --set ../inis/System64/UnrealTournament.ini Engine.GameReplicationInfo ServerName 'DECK16][ ALL WEAPONS HIGH PERFORMANCE'
crudini --set ../inis/System64/UnrealTournament.ini Engine.GameReplicationInfo ShortName 'DECK16][ ALL WEAPONS'
crudini --set ../inis/System64/User.ini Botpack.ChallengeBotInfo bAdjustSkill True
crudini --set ../inis/System64/User.ini Botpack.ChallengeBotInfo bRandomOrder False
crudini --set ../inis/System64/User.ini Botpack.ChallengeBotInfo Difficulty 7
sed -i '/ServerPackages=De/d' ../inis/System64/UnrealTournament.ini