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
_playerServerID = owner _player;
