/*
	File: restorePlayerLoadout.sqf

	Description:
	Used to restore players Loadout based on last connection, this will need to be
  run locally on the players computer, thus must be executed by the player

	Parameter(s):
  _this:
      0 - Player
      1 - Array -
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

_player = _this select 0;
_playerLoadout = _this select 1;

// Remove everything from Player
removeAllWeapons _player;
removeAllItems _player;
removeAllContainers _player;
removeAllAssignedItems _player;
removeHeadgear _player;

// Based on Array -> rearm the player
// Uniform
_player addHeadgear (_playerLoadout select 7);
_player addGoggles (_playerLoadout select 8);
_player forceAddUniform (_playerLoadout select 9);
_player addVest (_playerLoadout select 10);
_player addBackpack (_playerLoadout select 11);

// Primary Weapon
if ((_playerLoadout select 16 select 1) != 0) then {
_player addMagazine [_playerLoadout select 16 select 0,_playerLoadout select 16 select 1];
_player addWeapon (_playerLoadout select 1);
{_player addPrimaryWeaponItem (_x);} forEach (_playerLoadout select 4);
};

// Secondary
if ((_playerLoadout select 17 select 1) != 0) then {
  _player addMagazine [_playerLoadout select 17 select 0,_playerLoadout select 17 select 1];
  _player addWeapon (_playerLoadout select 2);
  {_player addSecondaryWeaponItem _x;} forEach (_playerLoadout select 5);
};

// Handgun
if ((_playerLoadout select 18 select 1) != 0) then {
_player addMagazine [_playerLoadout select 18 select 0,_playerLoadout select 18 select 1];
_player addWeapon (_playerLoadout select 3);
{_player addHandgunItem _x;} forEach (_playerLoadout select 6);
};

//Add Magazines
{_player addMagazine [(_x select 0), (_x select 1)];} forEach (_playerLoadout select 12);
//Add Items
{_player addItem _x;} forEach (_playerLoadout select 13);
{_player addItem _x;} forEach (_playerLoadout select 14);
{_player assignItem _x;} forEach (_playerLoadout select 14);
{_player addWeapon _x;} forEach (_playerLoadout select 15);
