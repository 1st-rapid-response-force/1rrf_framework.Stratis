/*
	File: getPlayerLoadout.sqf

	Description:
	Used to obtain all current weapons, items, and magazines to pass to Server for
  persistence.

	Parameter(s):
  _this:	OBJECT	- Player Object that needs to be examined

	Returns:
	_this: Array -
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
*/


// Establish Player Information
_player = _this select 0;
_playerName = name _player;
_playerUUID = getPlayerUID _player;

hint format["%1 %2",_player,_playerUUID];

// Call all relevant information functions for loadout
//Weapons

_weapons = weapons _player;

_primaryWeapon = primaryWeapon _player;

_primaryAttachments = primaryWeaponItems _player;
_handgunWeapon = handgunWeapon _player;
_handgunAttachments =  handgunItems _player;
_secondaryWeapon = secondaryWeapon _player;
_secondaryAttachments = secondaryWeaponItems _player;

// Uniform
_headgear = headgear _player;
_goggles = goggles _player;
_uniform = uniform _player;
_vest = vest _player;
_backpack = backpack _player;


//Held Magazine
_magazines = magazinesAmmo _player;
_primaryMagazineType = primaryWeaponMagazine _player;
_primaryMagazineAmmo = _player ammo _primaryWeapon;
_secondaryMagazineType = secondaryWeaponMagazine _player;
_secondaryMagazineAmmo = _player ammo _secondaryWeapon;
_handgunMagazineType = handgunMagazine _player;
_handgunMagazineAmmo = _player ammo _handgunWeapon;

//Items
_assignedItems = assignedItems _player;
_items = items _player;

//House Keeping
_misc = _weapons - [_primaryWeapon,_secondaryWeapon,_handgunWeapon];
_primaryMag = _primaryMagazineType+[_primaryMagazineAmmo];
_secondaryMag = _secondaryMagazineType+[_secondaryMagazineAmmo];
_handgunMag = _handgunMagazineType+[_handgunMagazineAmmo];

// Return Loadout
_playerLoadout = [[_playerName,_playerUUID],
				_primaryWeapon,
				_secondaryWeapon,
				_handgunWeapon,
				_primaryAttachments,
				_secondaryAttachments,
				_handgunAttachments,
				_headgear,
				_goggles,
				_uniform,
				_vest,
				_backpack,
				_magazines,
				_items,
				_assignedItems,
				_misc,
				_primaryMag,
				_secondaryMag,
				_handgunMag
];

// Call Function on Server by sending it the neccessary information
[_playerLoadout] remoteExecCall ["rrf_fnc_persistence_player_serverStoreLoadout", 2];
