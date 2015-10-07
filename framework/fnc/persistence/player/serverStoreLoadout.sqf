/*
	File: serverStoreLoadout.sqf

	Description:
	Called upon by local player side to store loadout, this will call Persistence
  Fusion engine to store player loadout.

	Parameter(s):
  _this:	Array -
          0 - Player Information [0 - Name, 1 - UUID]
          1 - Primary weapon
          2 - Secondary weapon
          3 - Handgun weapon
          4 - Primary Attachments [0 - silencer, 1 - laser, 2 - optics, 3 - bipod]
          5 - Secondary Attachments [0 - silencer, 1 - laser, 2 - optics, 3 - bipod]
          6 - Handgun Attachments [0 - silencer, 1 - laser, 2 - optics, 3 - bipod]
          7 - Headgear
          8 - Goggles
          9 - Uniform
          10 - Vest
          11 - Backpack
          12 - Magazines [[0 - classname, 1 - ammo count], ... ]
          13 - Items
          14 - Assigned Items
          15 - Misc
          16 - Primary Weapon Current Magazines [0 - magazine type, 1 - ammo count]
          17 - Secondary Weapon Current Magazine [0 - magazine type, 1 - ammo count]
          18 - Handgun Weapon Current Magzine [0 - magazine type, 1 - ammo count]

	Returns: Nothing
*/

_loadout = _this select 0;
hint format ["%1",_loadout];

// Fusion Code would need to then store this information
