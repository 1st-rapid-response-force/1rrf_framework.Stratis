/*
	File: serverStoreLoadout.sqf

	Description:
	Called upon by local player side to store loadout, this will call Persistence
  Fusion engine to store player loadout.

	Parameter(s):
  _this:	Array - 0 - Player UUID
                  1 - Array Loadout

	Returns: Nothing
*/

_loadout = _this select 0;

[[_loadout]] spawn {

        private["_method", "_response", "_params"];
        _perms = _this select 0;
        _loadout = _perms select 0;

        _method = "SAVE_PLAYER_INVENTORY";
        _params = [_loadout];
        _response = [_method, _params] call sock_rpc;

};
