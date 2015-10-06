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

_analystics = ["Loadout Accessed",_uuid] spawn rrf_fnc_analytics_analyticEvent;

[_uuid] spawn {
        private["_method", "_response", "_params"];
				_uuid = _this select 0;
        _method = "GET_LOADOUT";
        _params = [_uuid];

        _response = [_method, _params] call sock_rpc;
        hint _response;

		_case = "SMA_CASE_SMA_MK17" createVehicle getMarkerPos "spawn_test";

		clearWeaponCargo _case;
		clearItemCargo _case;

		for [{_i=0}, {_i<(count _response)}, {_i=_i+1}] do
		{
			_itemSlot = ((_response select _i) select 0);
			if ( _itemSlot == "primary" ) then {
				_case addWeaponCargo [(_response select _i) select 1, 1];
			};
		};

		_case addAction ["A Useless Action", ""];
    };
