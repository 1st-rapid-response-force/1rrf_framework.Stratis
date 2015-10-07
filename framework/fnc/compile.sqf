/*
* 1st RRF - Framework - Function Compile File - compile.sqf
* Used to compile functions for use in the game.
* Version 1.0
*/

/////////////////////SERVER\\\\\\\\\\\\\\\\\\\\\
if (isServer) then {
  rrf_fnc_loadout_serverGetLoadout = compile preprocessFile "framework\fnc\loadout\serverGetLoadout.sqf";
  rrf_fnc_analytics_analyticEvent = compile preprocessFile "framework\fnc\analytic\analyticEvent.sqf";
  rrf_fnc_persistence_player_serverStoreLoadout =  compile preprocessFile 'framework\fnc\persistence\player\serverStoreLoadout.sqf';
  rrf_fnc_persistence_player_serverRestoreLoadout =  compile preprocessFile 'framework\fnc\persistence\player\serverRestoreLoadout.sqf';
};

/////////////////////CLIENT AND SERVER\\\\\\\\\\\\\\\\\\\\\
// Debug
rrf_fnc_debug_arrayCheck = compile preprocessFile "framework\fnc\debug\arrayCheck.sqf";

// Loadout
rrf_fnc_loadout_nameLoadoutBox = compile preprocessFile 'framework\fnc\loadout\nameLoadoutBox.sqf';
rrf_fnc_loadout_removeLoadoutBox = compile preprocessFile 'framework\fnc\loadout\removeLoadoutBox.sqf';

// Persistence
//// Player
rrf_fnc_persistence_player_getPlayerLoadout =  compile preprocessfilelinenumbers 'framework\fnc\persistence\player\getPlayerLoadout.sqf';
rrf_fnc_persistence_player_restorePlayerLoadout =  compile preprocessfilelinenumbers 'framework\fnc\persistence\player\restorePlayerLoadout.sqf';
rrf_fnc_persistence_player_getPlayerPosition =  compile preprocessfilelinenumbers 'framework\fnc\persistence\player\getPlayerPosition.sqf';
rrf_fnc_persistence_player_restorePlayerPosition =  compile preprocessfilelinenumbers 'framework\fnc\persistence\player\restorePlayerPosition.sqf';


/////////////////////CLIENT\\\\\\\\\\\\\\\\\\\\\
if (!isDedicated) then {
  rrf_fnc_loadout_setupArmory = compile preprocessFile "framework\fnc\loadout\setupArmory.sqf";
  rrf_fnc_loadout_getLoadout = compile preprocessFile "framework\fnc\loadout\getLoadout.sqf";
};

hint "Compiled Functions";
