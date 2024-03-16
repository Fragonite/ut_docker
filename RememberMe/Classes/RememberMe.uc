//=============================================================================
// Based on FavThisServer.
//=============================================================================
class RememberMe expands Mutator config(RememberMe);

var() config int NotifyMinutes;
var() config int NotifyStartSeconds;
var int ClientNotifyMinutes;
var int ClientNotifyStartSeconds;
var string CheckFav;

var() string FavNotify;
var() string FavAlready;
var() string FavFull;
var() string FavAdded;
var() string FavFailed;

const FavCommand = "!fav";

replication {
	reliable if (Role == ROLE_Authority)
		ClientNotifyMinutes, ClientNotifyStartSeconds, ClientAddFav;
}

function PostBeginPlay() {
	Super.PostBeginPlay();
	
	if (Owner != None)
		return;

	ClientNotifyMinutes = NotifyMinutes;
	ClientNotifyStartSeconds = NotifyStartSeconds;
	
	Level.Game.RegisterMessageMutator(self);
}

simulated function PostNetBeginPlay() {
	Super.PostNetBeginPlay();

	if (Role < ROLE_Authority)
	{
		ClientAddFav();
	}

	if (ClientNotifyStartSeconds == 0)
		Timer();
	else if (ClientNotifyStartSeconds > 0)
		SetTimer(ClientNotifyStartSeconds, false);
}

simulated function Timer() {
	local PlayerPawn Player;

	if (IsInFavorites() || CheckFav == "")
		return;
		
	SetTimer(ClientNotifyMinutes*10, true);

	foreach AllActors(class'PlayerPawn', Player)
		if (Player.Player != None)
			break;
			
	if (Player == None)
		return;
	
	Player.ClientMessage(FavNotify @ FavCommand);
}

simulated function bool IsInFavorites() {
	local string Host;
	local int Port, i;

	if (CheckFav == "") {
		GetHostPort(Level.GetAddressURL(), Host, Port);
		if (Port == 0 || Host == "")
			return false;
		Port++;
		CheckFav = "\\" $ Host $ "\\" $ Port $ "\\";
	}
	
	for (i = 0; i < class'UBrowserFavoritesFact'.default.FavoriteCount && i < ArrayCount(class'UBrowserFavoritesFact'.default.Favorites); i++)
		if (InStr(class'UBrowserFavoritesFact'.default.Favorites[i], CheckFav) >= 0) {
			SetTimer(0, false);
			return true;
		}
	return false;
}

simulated function ClientAddFav() {
	local string Host;
	local int Port;
	if( Role < ROLE_Authority) {		
		if (IsInFavorites() || CheckFav == "") {
			PlayerPawn(Owner).ClientMessage(FavAlready);
		} else if (class'UBrowserFavoritesFact'.default.FavoriteCount >= ArrayCount(class'UBrowserFavoritesFact'.default.Favorites)) {
			PlayerPawn(Owner).ClientMessage(FavFull);
		} else {
			GetHostPort(Level.GetAddressURL(), Host, Port);
			if (Port > 1 && Host != "") {
				Port++;
				class'UBrowserFavoritesFact'.default.Favorites[class'UBrowserFavoritesFact'.default.FavoriteCount] = "\\" $ Host $ "\\" $ Port $ "\\False";
				if (false) class'UBrowserFavoritesFact'.default.Favorites[ArrayCount(class'UBrowserFavoritesFact'.default.Favorites) - 1] = ""; // for compile test
				class'UBrowserFavoritesFact'.default.FavoriteCount++;
				class'UBrowserFavoritesFact'.static.StaticSaveConfig();
				PlayerPawn(Owner).ClientMessage(FavAdded);
			} else {
				PlayerPawn(Owner).ClientMessage(FavFailed);
			}
		}
	}
}

static final function GetHostPort(string Address, out string Host, out int Port)
{
	local int i, j;
	
	Host = Address;
	while (true) {
		i = InStr(Address, ":");
		if (i < 0)
			break;
		Address = Mid(Address, i + 1);
	}
	Port = int(Address);
	Host = Left(Host, Len(Host) - Len(Address) - 1);
}

defaultproperties
{
      NotifyMinutes=1
      NotifyStartSeconds=10
      ClientNotifyMinutes=0
      ClientNotifyStartSeconds=0
      CheckFav=""
      FavNotify="To add this server to your favorites, write in the chat@@@"
      FavAlready="This server is already in the favorites."
      FavFull="Can't add this server to favorites - favorites list is full."
      FavAdded="This server has been successfully added to favorites."
      FavFailed="Failed to parse server address."
      bAlwaysRelevant=True
      RemoteRole=ROLE_SimulatedProxy
}
