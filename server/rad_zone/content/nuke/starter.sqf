//////////////////////////////////////////////////////////////
// code by W4lly63 20-06-15
//////////////////////////////////////////////////////////////
// EDIT BELOW
/////////////////////////////////////////////////////////////////////////////////////////
_location_array = [[834.508,7566.45,0.0014],[1102.76,7109.75,0.3619],[1153.61,7528.8,0.869],[1161.03,7716,0.846],[1385.27,7546.87,0.6599]]; // array nuke positions
_cycle_num = 5;  // num of explosion times
_arrTimer =[200,220,230,190,240,180]; //explode after .....(array timer sec.)
/////////////////////////////////////////////////////////////////////////////////////////


//----DONT TOUCH BELOW------------------------------------------------------------------------------------------------------

//---------------bomb---------------------
if (isNil "randomTimeBomb") then {
    randomTimeBomb = [0,[0,0,0]];
	publicVariable "randomTimeBomb";
};
_soundPath = [(str missionConfigFile), 0, -15] call BIS_fnc_trimString;
_soundToPlay = _soundPath + "sounds\raid.ogg";
_soundToPlay2 = _soundPath + "sounds\nuke.ogg";
_soundToPlay3 = _soundPath + "sounds\explo.ogg";

_stopper = 0;
    while {true} do
        {
		    _nukepos = _location_array select floor random count _location_array;  // select where bomb explode
	        
			
			
			_timeSleep = _arrTimer select floor random count _arrTimer;
			sleep _timeSleep;
			//----start alarm-----------------------
			randomTimeBomb = [1,_nukepos];
	        publicVariable "randomTimeBomb";
			diag_log format['Radiationzone Explosion position : %1 ',(randomTimeBomb select 1)];
			for "_i" from 1 to 6 do  // start alarm
			{
			    playSound3D [_soundToPlay, radiationzone, false, _nukepos, 20, 1, 1000];
				sleep 10;
			};
			//--------------------------------------
			randomTimeBomb = [2,_nukepos];
	        publicVariable "randomTimeBomb";
		    //-----start nuke-----------------------
			playSound3D [_soundToPlay2, radiationzone, false, _nukepos, 20, 1, 1000];
			call compile preprocessfilelinenumbers "\x\addons\rad_zone\content\nuke\nuke_damage.sqf"; // damages in radius after explosion
			sleep 14;
			playSound3D [_soundToPlay3, radiationzone, false, _nukepos, 20, 1, 1000];
		    
			sleep 30;
			randomTimeBomb = [0,_nukepos];
			publicVariable "randomTimeBomb";
			
	        _stopper =_stopper + 1;
			if(_stopper == _cycle_num)exitWith{};
        };

//------------------------------------------------------------------
_stopper= nil;
_soundPath = nil;
_soundToPlay = nil;
_soundToPlay2 = nil;
_soundToPlay3= nil;
_timeSleep =nil;