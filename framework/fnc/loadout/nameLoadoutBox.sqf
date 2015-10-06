/*
	File: nameLoadoutBox.sqf

	Description:
	A function used to add an action to name the Box for easy Identification

	Parameter(s):
  _this:	OBJECT	- Box that needs to be named
  STRING - Name of User

	Returns:
	Nothing
*/
if (isDedicated) exitWith {};
_perms = _this select 0;
_case = _perms select 0;
_name = _perms select 1;

_case addAction [_name,{hint format ["This Box Belongs to %1",_this select 3 select 0];},[_name]];
