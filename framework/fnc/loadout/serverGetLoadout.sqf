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

_analystics = ["Loadout Accessed",_uuid] spawn rrf_fnc_analytics_analyticEvent;

[_uuid] spawn {
        private["_method", "_response", "_params"];
				_uuid = _this select 0;
        _method = "GET_LOADOUT";
        _params = [_uuid];
        _response = [_method, _params] call sock_rpc;

		_case = "SMA_CASE_SMA_MK17" createVehicle getMarkerPos "spawn_test";

		clearWeaponCargoGlobal _case;
		clearItemCargoGlobal _case;

		for [{_i=0}, {_i<(count _response)}, {_i=_i+1}] do
		{
			_itemSlot = ((_response select _i) select 0);
			if ( _itemSlot == "primary"  || _itemSlot == "secondary" || _itemSlot == "launcher" ) then {
				_case addWeaponCargoGlobal [(_response select _i) select 1, 1];
			};
			
			if ( _itemSlot == "uniform" || _itemSlot == "vest" || _itemSlot == "helmet" || _itemSlot == "goggles" || _itemSlot == "nightvision" || _itemSlot == "binoculars" || _itemSlot == "primary_attachments" || _itemSlot == "secondary_attachments" ) then {
				_case addItemCargoGlobal [(_response select _i) select 1, 1];
			};
			
			if ( _itemSlot == "backpack" ) then {
				_case addBackpackCargoGlobal [(_response select _i) select 1, 1];
			};
			
			
			
		};
    };
