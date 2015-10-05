/*
	File: getLoadout.sqf

	Description:
	This is the player side function that will allow the script to get all neccessary
  before passing it to the server to make the function call.

	Parameter(s):
  _this:	OBJECT	- Armorer Unit that will serve as the base armorer

	Returns:
	Nothing
*/

_player = player;
_uuid = getPlayerUID _player;
hint format ["Loadout request received, one moment.", _uuid];

// Call Function on Server by sending it the neccessary information
[[_uuid],"rrf_fnc_loadout_serverGetLoadout",false] call BIS_fnc_MP;
