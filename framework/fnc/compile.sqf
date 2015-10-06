/*
* 1st RRF - Framework - Function Compile File - compile.sqf
* Used to compile functions for use in the game.
* Version 1.0
*/

/////////////////////SERVER\\\\\\\\\\\\\\\\\\\\\
if (isServer) then {
  rrf_fnc_loadout_serverGetLoadout = compile preprocessFile "framework\fnc\loadout\serverGetLoadout.sqf";
  rrf_fnc_analytics_analyticEvent = compile preprocessFile "framework\fnc\analytic\analyticEvent.sqf";
};

/////////////////////CLIENT AND SERVER\\\\\\\\\\\\\\\\\\\\\
rrf_fnc_compileSuccess = compile preprocessFile "framework\fnc\debug\compileSuccessful.sqf";
rrf_fnc_nameLoadoutBox = compile preprocessFile 'framework\fnc\loadout\nameLoadoutBox.sqf';
rrf_fnc_removeLoadoutBox = compile preprocessFile 'framework\fnc\loadout\removeLoadoutBox.sqf';

/////////////////////CLIENT\\\\\\\\\\\\\\\\\\\\\
if (!isDedicated) then {
  rrf_fnc_loadout_setupArmory = compile preprocessFile "framework\fnc\loadout\setupArmory.sqf";
  rrf_fnc_loadout_getLoadout = compile preprocessFile "framework\fnc\loadout\getLoadout.sqf";
};
