/*
* 1st RRF - Framework - Player Initalization - init_server.sqf
* Server Initalization
* Version 1.0
*/

// Load the SQF Log
private["_h"];
_h = [] execVM "lib\log.sqf";
waitUntil {scriptDone _h};

// Load the Sock RPC Library
private["_h"];
_h = [] execVM "lib\sock.sqf";
waitUntil {scriptDone _h};
