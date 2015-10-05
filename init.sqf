/*
* 1st RRF - Framework - Master Initalization File - init.sqf
* Used to call all Initalization files
* Version 1.0
*/

enableSaving [false, false];

// Call Init Files for both Server and Player 1st RRF Framework
call compile preprocessFile "framework\fnc\compile.sqf";

if (isServer) then {
	call compile preprocessFile "framework\init_server.sqf";
};

call compile preprocessFile "framework\init_common.sqf";

if (!isDedicated) then {
	call compile preprocessFile "framework\init_player.sqf";
};


// Deal with Node Library
waitUntil {isDedicated || {not(isNull player)}};

//load the logging library
private["_h"];
_h = [] execVM "lib\log.sqf";
waitUntil {scriptDone _h};

//load the socket rpc library
private["_h"];
_h = [] execVM "lib\sock.sqf";
waitUntil {scriptDone _h};


/*
 * Note that the "spawn" calls around the function definitions.
 * This is so that sock_rpc calls execute inside a scheduled environment.
 *
 * If you are calling sock_rpc on the server side, this is not needed.
 */

getDate = {_this spawn {
  private["_data"];
  _data = ["getDate"] call sock_rpc;

  if (isNil "_data") exitWith {};
   player globalChat _data;
}};

getLongString = {_this spawn {
  private["_data"];
  _data = ["get32kString"] call sock_rpc;
  if (isNil "_data") exitWith {};
  player globalChat _data;
}};
