#!/bin/bash
# Run after dump_gog.sh, dump_oldunreal.sh, dump_mutators.sh

set -e
mkdir -p resources
cd resources

crudini --set --ini-options=nospace ../build/inis/System/UnrealTournament.ini IpDrv.TcpNetDriver MaxClientRate 100000
crudini --set --ini-options=nospace ../build/inis/System/UnrealTournament.ini IpDrv.TcpNetDriver NetServerMaxTickRate 100
crudini --set --ini-options=nospace ../build/inis/System/UnrealTournament.ini IpDrv.TcpNetDriver LanServerMaxTickRate 100
crudini --set --ini-options=nospace ../build/inis/System/UnrealTournament.ini Engine.DemoRecDriver MaxClientRate 100000
crudini --set --ini-options=nospace ../build/inis/System/UnrealTournament.ini Engine.DemoRecDriver NetServerMaxTickRate 100
crudini --set --ini-options=nospace ../build/inis/System/UnrealTournament.ini Engine.DemoRecDriver LanServerMaxTickRate 100
crudini --set --ini-options=nospace ../build/inis/System/UnrealTournament.ini Engine.GameReplicationInfo ServerName 'DECK16][ ALL WEAPONS HIGH PERFORMANCE'
crudini --set --ini-options=nospace ../build/inis/System/UnrealTournament.ini Engine.GameReplicationInfo ShortName 'DECK16][ ALL WEAPONS'
crudini --set --ini-options=nospace ../build/inis/System/User.ini Botpack.ChallengeBotInfo bAdjustSkill True
crudini --set --ini-options=nospace ../build/inis/System/User.ini Botpack.ChallengeBotInfo bRandomOrder False
crudini --set --ini-options=nospace ../build/inis/System/User.ini Botpack.ChallengeBotInfo Difficulty 7
sed -i '/ServerPackages=De/d' ../build/inis/System/UnrealTournament.ini
crudini --set --ini-options=nospace ../build/inis/System/UnrealTournament.ini Botpack.DeathMatchPlus MinPlayers 3
crudini --set --ini-options=nospace ../build/inis/System/UnrealTournament.ini Botpack.DeathMatchPlus FragLimit 50
crudini --set --ini-options=nospace ../build/inis/System/UnrealTournament.ini Botpack.DeathMatchPlus TimeLimit 20
crudini --set --ini-options=nospace ../build/inis/System/UnrealTournament.ini Botpack.DeathMatchPlus bChangeLevels False
crudini --set --ini-options=nospace ../build/inis/System/UnrealTournament.ini Botpack.DeathMatchPlus bForceRespawn True
crudini --set --ini-options=nospace ../build/inis/System/UnrealTournament.ini Botpack.DeathMatchPlus NetWait 0
# crudini --set --ini-options=nospace ../build/inis/System/UnrealTournament.ini Botpack.DeathMatchPlus RestartWait 0
crudini --set --ini-options=nospace ../build/inis/System/UnrealTournament.ini IpServer.UdpServerUplink DoUplink True
crudini --set --ini-options=nospace ../build/inis/System/UnrealTournament.ini IpServer.UdpServerUplink UpdateMinutes 1

# AMD64
# mv ../build/inis/System ../build/inis/System64
# AMD64 END

# ARM
mv ../build/inis/System ../build/inis/SystemARM64
# ARM END