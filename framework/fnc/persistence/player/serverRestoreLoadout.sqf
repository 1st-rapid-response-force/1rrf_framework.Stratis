/*
	File: serverRestoreLoadout.sqf

	Description:
	Called upon by MP_Connected event that invokes the server to contact the Fusion
  API to get the position of the player was using before last disconnect. If the server
  cannot pull any information (first connect it will bypass and allow user to spawn on original spawn position)

	Parameter(s):
  _this:	Object - Player who needs to have loadout Restored
					Number - Owner Number used to execute code remotely

	Returns: Nothing
*/

_player = _this select 0;
_playerUUID = getPlayerUID _player;
_ownerID = _this select 1;

//Fusion Code to Pull and store information
//_loadoutArray = [];  // Should be last thing done as this needs to return null if no information is stored

//Fusion will need to return a null for no value found
if (!isNil "_loadoutArray") then {
    [_player,_loadoutArray] remoteExecCall ["rrf_fnc_persistence_player_restorePlayerLoadout",_ownerID];
} else {
  if (debugEnabled == 1) then {
      hint "Null Value -> no loadout selected";
  };
};
