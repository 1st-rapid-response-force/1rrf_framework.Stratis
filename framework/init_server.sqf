/*
* 1st RRF - Framework - Player Initalization - init_server.sqf
* Server Initalization
* Version 1.0
*/

//Load Server events
_h = [] execVM "framework\fnc\serverEvents.sqf";

// Load the SQF Log
private["_h"];
_h = [] execVM "framework\lib\log.sqf";
waitUntil {scriptDone _h};

// Load the Sock RPC Library
private["_h"];
_h = [] execVM "framework\lib\sock.sqf";
waitUntil {scriptDone _h};
