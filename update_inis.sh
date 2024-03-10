#!/bin/bash
# Run after dump_oldunreal.sh

set -e
mkdir -p resources
cd resources

# AMD64
crudini --set ../build/inis/System64/UnrealTournament.ini IpDrv.TcpNetDriver MaxClientRate 100000
crudini --set ../build/inis/System64/UnrealTournament.ini IpDrv.TcpNetDriver NetServerMaxTickRate 100
crudini --set ../build/inis/System64/UnrealTournament.ini IpDrv.TcpNetDriver LanServerMaxTickRate 100
crudini --set ../build/inis/System64/UnrealTournament.ini Engine.DemoRecDriver MaxClientRate 100000
crudini --set ../build/inis/System64/UnrealTournament.ini Engine.DemoRecDriver NetServerMaxTickRate 100
crudini --set ../build/inis/System64/UnrealTournament.ini Engine.DemoRecDriver LanServerMaxTickRate 100
crudini --set ../build/inis/System64/UnrealTournament.ini Engine.GameReplicationInfo ServerName 'DECK16][ ALL WEAPONS HIGH PERFORMANCE'
crudini --set ../build/inis/System64/UnrealTournament.ini Engine.GameReplicationInfo ShortName 'DECK16][ ALL WEAPONS'
crudini --set ../build/inis/System64/User.ini Botpack.ChallengeBotInfo bAdjustSkill True
crudini --set ../build/inis/System64/User.ini Botpack.ChallengeBotInfo bRandomOrder False
crudini --set ../build/inis/System64/User.ini Botpack.ChallengeBotInfo Difficulty 7
sed -i '/ServerPackages=De/d' ../build/inis/System64/UnrealTournament.ini
# AMD64 END