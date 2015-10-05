/*
	File: serverGetLoadout.sqf

	Description:
	This is the server side function that will invoke fusion in order to spawn the
  players loadout.

	Parameter(s):
  _this:	STRING	- UUID of player who invoked the function call

	Returns:
	Nothing
*/

_uuid = _this select 0;

hint format ['Server execution of loadout function %1',_uuid];

// FUSION Code should now execute here
