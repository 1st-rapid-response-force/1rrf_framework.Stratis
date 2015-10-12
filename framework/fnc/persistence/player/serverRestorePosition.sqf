/*
	File: serverStoreLoadout.sqf

	Description:
	Called upon by MP_Connected event that invokes the server to contact the Fusion
  API to get the loadout the player was using before last disconnect. If the server
  cannot pull any information (first connect it will establish the default loadout and invoke it on the player)

	Parameter(s):
  _this:	Object - Player who needs to have loadout Restored

	Returns: Nothing
*/

_player = _this select 0;
_playerUUID = getPlayerUID _player;
_ownerID = owner _player;



//Fusion Code to Pull and store information REMEMBER TO PHARSE THE FUCKING OWNER ID
//_positionArray = []; // Should be last thing done as this needs to return null if no information is stored

//Fusion will need to return this null for no value found

    [_player,_positionArray] remoteExecCall ["rrf_fnc_persistence_player_restorePlayerPosition",_ownerID];
