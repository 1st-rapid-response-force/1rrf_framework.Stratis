/*
* 1st RRF - Framework - Player Initalization - init_player.sqf
* Player Initalization
* Version 1.0
*/

[] execVM "framework\doc.sqf";

[] spawn {
	waitUntil {!isNull player};
	//Gets ID used for remoteExec
	_ownerID = owner player;

	// Persistence Code - Calls to Server / Server Excutes Actual Functions to Player
	[[player,_ownerID],"rrf_fnc_persistence_player_serverRestoreLoadout",false] call BIS_fnc_MP;
	[[player,_ownerID],"rrf_fnc_persistence_player_serverRestorePosition",false] call BIS_fnc_MP;


};
