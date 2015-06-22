// code by W4lly63
  
   
   
   
   box_array = _this select 0;
   spawnCenter = _this select 1; 
   _box = "CargoNet_01_box_F";  // dont change this-------------
   _max = 500;

//Waits until player gets near  crates to end mission 
    
	CrateTimeout = (diag_tickTime + 600);
	_crateFound = false;
	_crateTimedOut = false;
	while {true} do {
	    if (_crateFound ) then{
		    CrateTimeout = (diag_tickTime + 600);
			_crateFound = false;
		};
		if (diag_tickTime  > CrateTimeout) then {
		    _list = spawnCenter  nearObjects [_box,_max];
            _numbCrates = (count _list) ;
		     diag_log format['RadiationZone Start Delete crates : %1 ',_numbCrates];
			_crateTimedOut = true;			
			{deleteVehicle _x} forEach _list;
			
		};
		uiSleep 15;
		_list = spawnCenter  nearObjects [_box,_max];
		for "_i" from 0 to ((count _list) -1) do {
		    if ({isPlayer _x && _x distance (box_array select _i)< 10} count playableUnits > 0) then {
			    _crateFound = true;
		    };
		};
		if (_crateTimedOut) exitWith {call compile preprocessFileLineNumbers "\x\addons\rad_crates\content\spawncrates.sqf";};
		//uiSleep 15;
	};
	
	

