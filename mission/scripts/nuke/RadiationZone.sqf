//code by W4lly63-----------------

_antiRadUniform = ["U_O_PilotCoveralls","U_Wetsuit_Camo"];  //antirad uniform array
_antiRadHelmet=["H_31_EPOCH","H_PilotHelmetFighter_I"];   // antirad helmets array

/////////////////////////////////////////////////////////////


//----------visual effect--------------------
winds =
{
    while {true} do
    {
	waitUntil {
        inRadiationZone
    };
        _ran = ceil random 2;
        _pos = position player;
        _velocity = [random 10,random 10,-1];
        _color = [1.0, 0.9, 0.8];
        _alpha = 0.02 + random 0.02;
        _ps = "#particlesource" createVehicleLocal _pos;  
        _ps setParticleParams [["\a3\data_f\particleEffects\universal\universal.p3d", 16, 12, 8], "", "Billboard", 1, 3, [0, 0, -6], _velocity, 1, 1.275, 1, 0, [9], [_color + [0], _color + [_alpha], _color + [0]], [1000], 1, 0, "", "", _pos];
        _ps setParticleRandom [3, [30, 30, 0], [0, 0, 0], 1, 0, [0, 0, 0, 0.01], 0, 0];
        _ps setParticleCircle [0.1, [0, 0, 0]];
        _ps setDropInterval 0.01;
        sleep (random 1);
        _delay = 1 + random 5;
        sleep _delay;
        deletevehicle _ps;
    };
};

ash =
{
    _pos = position player;
    _parray = 
    [
    ["\a3\data_f\particleEffects\universal\universal", 16, 12, 8, 1],
    "",
    "Billboard",
    1,
    4,
    [0,0,0],
    [0,0,0],
    1,
    0.000001,
    0,
    1.4,
    [0.05,0.05],
    [[0.1,0.1,0.1,1]],
    [0,1],
    0.2,
    1.2,
    "",
    "",
    vehicle player
    ];
	
    _ash = "#particlesource" createVehicleLocal _pos;  
    _ash setParticleParams _parray;
    _ash setParticleRandom [0, [10, 10, 7], [0, 0, 0], 0, 0.01, [0, 0, 0, 0.1], 0, 0];
    _ash setParticleCircle [0.0, [0, 0, 0]];
    _ash setDropInterval 0.003;
	
	while {true} do
    {
	waitUntil {
        ! inRadiationZone
    };
        
        deletevehicle _ash;
    };
};
//-------------------------------------------------------------------------

//--------------------------------------------------------------------------
NukeON = {
    _rad1 = ppEffectCreate ["colorCorrections", 1501];
    _rad1 ppEffectEnable true;
    _rad1 ppEffectAdjust [1, 1, 0, [0.0, 0.0, 0.0, 0.0], [0.8*2, 0.5*2, 0.0, 0.7], [0.9, 0.9, 0.9, 0.0]];
    _rad1 ppEffectCommit 5;
    
}; 

NukeOff = {
    _rad1 = ppEffectCreate ["colorCorrections", 1501];
    _rad1 ppEffectEnable true;
    _rad1 ppEffectAdjust [1, 1, 0, [0,0,0,0], [1.1,0.7,1.1,1.1], [1.0,0.7,1.0,1.1]]; 
    _rad1 ppEffectCommit 45;
    
};

//----------end visual effects----------



if (isNil "inRadiationZone") then {
    inRadiationZone = false;
};


while {
    true
}
do {
    waitUntil {
        inRadiationZone
    };
	
     playSound "s_geiger";
	 _uniform = uniform player;
	 _damage = damage player;
	 _headgear = headgear player;
	 //----uniform and damage-------
	 if(_uniform in _antiRadUniform)then{
	   if( _headgear in _antiRadHelmet)then{
	       playSound "s_mask";
		   if( _damage > 0)then{
		     _damage = _damage - 0.004;
		   };
		};
		_damage = _damage + 0.005;
	    player setDamage _damage;
	    EPOCH_playerToxicity = EPOCH_playerToxicity + 0.02;
        sleep 3		
	};
	if !(_uniform in _antiRadUniform)then{
	   _damage = _damage + 0.01;
	   player setDamage _damage;
	   EPOCH_playerToxicity = EPOCH_playerToxicity + 0.1;
       sleep 3
   }; 
   
}; 

_damage = nil;
