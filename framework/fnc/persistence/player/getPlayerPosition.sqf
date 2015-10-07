/*
	File: getPlayerPosition.sqf

	Description:
	Used to obtain players current position in the world.

	Parameter(s):
  _this:	OBJECT	- Player Object that needs to be examined

	Returns:
	_this: Array
        0 - Player Information [0 - Name, 1 - UUID]
        1 - Player Position

*/

_player = _this select 0;
_playerName = name _player;
_playerUUID = getPlayerUID _player;
_position = position _player;
_positionArray = [[_playerName,_playerUUID],_position];


// Call Function on Server by sending it the neccessary information
[[_positionArray],"rrf_fnc_persistence_player_serverStorePosition",false] call BIS_fnc_MP;
