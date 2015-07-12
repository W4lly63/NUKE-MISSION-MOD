/*
	File: spawncrates.sqf
	Author: NedFox [TZW]
	Description: Custom Crates, randomly placed around a marker.
	Edit: W4lly63	
*/
if (isServer) then {

//------------------------------------------------------------

_numberofcrates = 3;								// this is the number of crates that you want to spawn								
spawnCenter = [947.996,7475.45,114.796777]; 	// coords center where spawn crates
_min = 1; 											// minimum distance from the center position (Number) in meters
_max = 200 ; 											// Example : maximum range of spawned crates, to keep them INSIDE the sector B compound

_mindist = 2; 		// minimum distance from the nearest object (Number) in meters, ie. spawn at least this distance away from anything within x meters..
_water = 0;			// water mode (Number)	0: cannot be in water , 1: can either be in water or not , 2: must be in water
_shoremode = 0; 	// 0: does not have to be at a shore , 1: must be at a shore
_marker = false; 	// Draw a green circle in which the crate will be spawned randomly
_markersize = 5; 	// Radius of the marker in meters

box_array  = [];
//--------------------------------------------------------------

  diag_log format['Start spawnCrates RadiationZone : %1',diag_tickTime];

  for "_i" from 1 to _numberofcrates do
  {
	_pos = [spawnCenter,_min,_max,_mindist,_water,2000,_shoremode] call BIS_fnc_findSafePos; 		// find a random location within range

	if (_marker) then {
	    _event_marker = createMarker [ format ["loot_marker_%1", _i], _pos];
		_event_marker setMarkerShape "ELLIPSE";
		_event_marker setMarkerColor "ColorGreen";
		_event_marker setMarkerAlpha 0.75;
		_event_marker setMarkerSize [(_markersize+15), (_markersize+15)]; 							//green circle slightly bigger , box can spawn just outside if not increased
		_pos = [_pos,0,_markersize,0,_water,2000,_shoremode] call BIS_fnc_findSafePos; 	 			//find a random spot INSIDE the marker area
		_pos = [_pos select 0, _pos select 1, 0];
		
	};
	
	

	diag_log format['RadiationZone Spawncrate %1 : Location %2',_i,_pos];
	_box = "CargoNet_01_box_F" createvehicle _pos;  				                              //create the crate  .. These ARE liftable with chopper like the CH-67 , but will not stay after restarts !	
	clearMagazineCargoGlobal _box;
	clearWeaponCargoGlobal _box;
    clearItemCargoGlobal _box;
	_box setVariable ["permaLoot",true];							                              //stay until reset
	_box allowDamage false;											                              // Prevent boxes to explode when spawning
	
//-----------------------------------------------------------------------------
	
	_box addWeaponCargoGlobal ["srifle_LRR_F",  				(random 4)];
	_box addWeaponCargoGlobal ["AKM_EPOCH", 					(random 1)];
	_box addWeaponCargoGlobal ["MultiGun", 						(random 3)];
	_box addWeaponCargoGlobal ["srifle_DMR_06_camo_F", 		    (random 4)];
	_box addWeaponCargoGlobal ["m4a3_EPOCH", 					(random 4)];
	_box addWeaponCargoGlobal ["LMG_Mk200_F", 			        (random 4)];
	_box addWeaponCargoGlobal ["m107Tan_EPOCH",                 (random 4)];

	_box addMagazineCargoGlobal ["5Rnd_127x108_Mag", 			(random 10)];
	_box addMagazineCargoGlobal ["30Rnd_762x39_Mag", 			(random 10)];
	_box addMagazineCargoGlobal ["SatchelCharge_Remote_Mag", 	(random 5)];
	_box addMagazineCargoGlobal ["HandGrenade", 				(random 5)];
	_box addMagazineCargoGlobal ["20Rnd_762x51_Mag", 		    (random 10)];
	_box addMagazineCargoGlobal ["5Rnd_127x108_Mag", 		    (random 5)];
	_box addMagazineCargoGlobal ["7Rnd_408_Mag", 		        (random 5)];
	_box addMagazineCargoGlobal ["10Rnd_762x51_Mag", 		    (random 10)];
	_box addMagazineCargoGlobal ["10Rnd_338_Mag", 	            (random 10)];
	_box addMagazineCargoGlobal ["200Rnd_65x39_cased_Box_Tracer",    (random 10)];
	_box addMagazineCargoGlobal ["30Rnd_556x45_Stanag",         (random 10)];

	_box addItemCargoGlobal ["optic_Nightstalker", 				(random 5)];
	_box addItemCargoGlobal ["optic_tws", 						(random 3)];
	_box addItemCargoGlobal ["NVG_EPOCH", 						(random 5)];
	_box addItemCargoGlobal ["Rangefinder", 					(random 10)];
	_box addItemCargoGlobal ["WhiskeyNoodle", 					(random 1)];
	_box addItemCargoGlobal ["ItemGoldBar10oz", 				(random 10)];
	_box addItemCargoGlobal ["ItemTopaz", 						(random 5)];
	_box addItemCargoGlobal ["FAK", 							(random 10)];
	_box addItemCargoGlobal ["EnergyPack", 						(random 5)];
	_box addItemCargoGlobal ["EnergyPackLg", 					(random 5)];
	_box addItemCargoGlobal ["Heal_EPOCH", 						(random 5)];
	_box addItemCargoGlobal ["Defib_EPOCH", 					(random 5)];
	_box addItemCargoGlobal ["Repair_EPOCH", 					(random 5)];
	_box addItemCargoGlobal ["ItemCorrugated", 					(random 10)];
	_box addItemCargoGlobal ["ItemCorrugatedLg", 				(random 10)];
	_box addItemCargoGlobal ["ItemLockbox", 					(random 5)];
	_box addItemCargoGlobal ["KitShelf", 						(random 5)];
	_box addItemCargoGlobal ["KitCinderWall", 					(random 10)];
	_box addItemCargoGlobal ["KitPlotPole", 					(random 3)];
	_box addItemCargoGlobal ["V_40_EPOCH", 						(random 5)];
	_box addItemCargoGlobal ["KitFoundation", 				    (random 5)];
	_box addItemCargoGlobal ["KitWoodStairs", 				    (random 10)];
	_box addItemCargoGlobal ["U_O_GhillieSuit", 				(random 3)];
	_box addItemCargoGlobal ["KitStudWall", 				    (random 10)];
	_box addItemCargoGlobal ["KitWoodFloor", 				    (random 10)];

	_box addBackpackCargoGlobal ["B_Carryall_cbr", 				(random 3)];
	_box addBackpackCargoGlobal ["B_Parachute", 				(random 3)];
	_box addBackpackCargoGlobal ["B_Carryall_ocamo",  			(random 3)];
	
	//----------------------------------------------------------------------------------
	_box_now =[_box];
	box_array = box_array + _box_now;
    };
	
   
};

nul = [box_array,spawnCenter] execVM "\x\addons\rad_zone\content\clean_replace.sqf";
	
	


