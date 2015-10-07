/*
	File: serverEvents.sqf

	Description:
	The Server Event handler registers multiple events for analytics and persistence
  handling.

	Parameter(s): None

	Returns: Nothing
*/

onPlayerConnected {
  _analystics = ["User Connected",_uuid] spawn rrf_fnc_analytics_analyticEvent;
};

onPlayerDisconnected {
    _analystics = ["User Disconnected",_uuid] spawn rrf_fnc_analytics_analyticEvent;
};
