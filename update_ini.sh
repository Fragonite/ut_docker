#!/bin/bash
cp oldunreal/System64/Default.ini oldunreal/System64/UnrealTournament.ini
cp oldunreal/System64/DefUser.ini oldunreal/System64/User.ini
crudini --set oldunreal/System64/UnrealTournament.ini IpDrv.TcpNetDriver MaxClientRate 100000
crudini --set oldunreal/System64/UnrealTournament.ini IpDrv.TcpNetDriver NetServerMaxTickRate 100
crudini --set oldunreal/System64/UnrealTournament.ini IpDrv.TcpNetDriver LanServerMaxTickRate 100
crudini --set oldunreal/System64/UnrealTournament.ini Engine.DemoRecDriver MaxClientRate 100000
crudini --set oldunreal/System64/UnrealTournament.ini Engine.DemoRecDriver NetServerMaxTickRate 100
crudini --set oldunreal/System64/UnrealTournament.ini Engine.DemoRecDriver LanServerMaxTickRate 100
crudini --set oldunreal/System64/UnrealTournament.ini Engine.GameReplicationInfo ServerName 'DECK16][ ALL WEAPONS HIGH PERFORMANCE'
crudini --set oldunreal/System64/UnrealTournament.ini Engine.GameReplicationInfo ShortName 'DECK16][ ALL WEAPONS'
crudini --set oldunreal/System64/User.ini Botpack.ChallengeBotInfo bAdjustSkill True
crudini --set oldunreal/System64/User.ini Botpack.ChallengeBotInfo bRandomOrder False
crudini --set oldunreal/System64/User.ini Botpack.ChallengeBotInfo Difficulty 7
sed -i '/ServerPackages=De/d' oldunreal/System64/UnrealTournament.ini