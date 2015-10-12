waitUntil {!isNull player};
//Gets ID used for remoteExec
_player = player;


// Persistence Code - Calls to Server / Server Excutes Actual Functions to Player
if (rrfPersistence == 1) then {
  [player] remoteExecCall ["rrf_fnc_persistence_player_serverRestoreLoadout",2];
  //[player,_ownerID] remoteExecCall ["rrf_fnc_persistence_player_serverRestorePosition",2];
};
