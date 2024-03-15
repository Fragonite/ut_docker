#!/bin/bash
# Run after dump_oldunreal.sh

set -e
mkdir -p resources
cd resources

# AMD64
crudini --set --ini-options=nospace ../build/inis/System64/UnrealTournament.ini IpDrv.TcpNetDriver MaxClientRate 100000
crudini --set --ini-options=nospace ../build/inis/System64/UnrealTournament.ini IpDrv.TcpNetDriver NetServerMaxTickRate 100
crudini --set --ini-options=nospace ../build/inis/System64/UnrealTournament.ini IpDrv.TcpNetDriver LanServerMaxTickRate 100
crudini --set --ini-options=nospace ../build/inis/System64/UnrealTournament.ini Engine.DemoRecDriver MaxClientRate 100000
crudini --set --ini-options=nospace ../build/inis/System64/UnrealTournament.ini Engine.DemoRecDriver NetServerMaxTickRate 100
crudini --set --ini-options=nospace ../build/inis/System64/UnrealTournament.ini Engine.DemoRecDriver LanServerMaxTickRate 100
crudini --set --ini-options=nospace ../build/inis/System64/UnrealTournament.ini Engine.GameReplicationInfo ServerName 'DECK16][ ALL WEAPONS HIGH PERFORMANCE'
crudini --set --ini-options=nospace ../build/inis/System64/UnrealTournament.ini Engine.GameReplicationInfo ShortName 'DECK16][ ALL WEAPONS'
crudini --set --ini-options=nospace ../build/inis/System64/User.ini Botpack.ChallengeBotInfo bAdjustSkill False
crudini --set --ini-options=nospace ../build/inis/System64/User.ini Botpack.ChallengeBotInfo bRandomOrder False
crudini --set --ini-options=nospace ../build/inis/System64/User.ini Botpack.ChallengeBotInfo Difficulty 7
sed -i '/ServerPackages=De/d' ../build/inis/System64/UnrealTournament.ini
crudini --set --ini-options=nospace ../build/inis/System64/UnrealTournament.ini Botpack.DeathMatchPlus MinPlayers 3
crudini --set --ini-options=nospace ../build/inis/System64/UnrealTournament.ini Botpack.DeathMatchPlus FragLimit 50
crudini --set --ini-options=nospace ../build/inis/System64/UnrealTournament.ini Botpack.DeathMatchPlus TimeLimit 20
crudini --set --ini-options=nospace ../build/inis/System64/UnrealTournament.ini Botpack.DeathMatchPlus bChangeLevels False
crudini --set --ini-options=nospace ../build/inis/System64/UnrealTournament.ini Botpack.DeathMatchPlus bForceRespawn True
crudini --set --ini-options=nospace ../build/inis/System64/UnrealTournament.ini Botpack.DeathMatchPlus NetWait 0
# crudini --set --ini-options=nospace ../build/inis/System64/UnrealTournament.ini Botpack.DeathMatchPlus RestartWait 0
crudini --set --ini-options=nospace ../build/inis/System64/UnrealTournament.ini IpServer.UdpServerUplink DoUplink True
crudini --set --ini-options=nospace ../build/inis/System64/UnrealTournament.ini IpServer.UdpServerUplink UpdateMinutes 1
# AMD64 END