//=============================================================================
// Based on FavThisServer.
//=============================================================================
class RememberMe expands Mutator;

var string CheckFav;

replication {
	reliable if (Role == ROLE_Authority)
		ClientAddFav;
}

simulated function PostNetBeginPlay() {
	Super.PostNetBeginPlay();
	
	if (Owner != None)
		return;
	
	ClientAddFav();
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
			return true;
		}
	return false;
}

simulated function ClientAddFav() {
	local string Host;
	local int Port;
	if( Role < ROLE_Authority) {		
		if (IsInFavorites() || CheckFav == "") {
			return;
		} 
		
		if (class'UBrowserFavoritesFact'.default.FavoriteCount >= ArrayCount(class'UBrowserFavoritesFact'.default.Favorites)) {
			return;
		}
		
		GetHostPort(Level.GetAddressURL(), Host, Port);

		if (Port > 1 && Host != "") {
			Port++;
			class'UBrowserFavoritesFact'.default.Favorites[class'UBrowserFavoritesFact'.default.FavoriteCount] = "\\" $ Host $ "\\" $ Port $ "\\False";
			class'UBrowserFavoritesFact'.default.FavoriteCount++;
			class'UBrowserFavoritesFact'.static.StaticSaveConfig();
		}
	}
}

static final function GetHostPort(string Address, out string Host, out int Port)
{
	local int i;
	
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
      CheckFav=""
      bAlwaysRelevant=True
      RemoteRole=ROLE_SimulatedProxy
}
