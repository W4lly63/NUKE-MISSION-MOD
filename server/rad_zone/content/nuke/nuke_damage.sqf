//////////////////////////////////////////////////////////////
// MADE BY MOERDERHOSCHI
// ARMED-ASSAULT.DE
// 06.11.2013
//Edited by W4lly63  20-06-15
///////////////////////////////////////////////////////////////////////////////

nuke_destruction = 200; // DESTRUCTION  USE 0 TO DEACTIVATE
nuke_destruction_ext = 500; // DESTRUCTION  EXTERNAL RING USE 0 TO DEACTIVATE

///////////////////////////////////////////////////////////////////////////////

if (nuke_destruction > 0)then{

      //{_x setdamage 1} forEach (nearestObjects [(_nukepos), [], nuke_destruction]);
	  _array_dam = _nukepos nearObjects ["All", nuke_destruction];
      {_x setdamage 1} forEach _array_dam; 
	  
	  {HideObject _x} forEach _array_dam;

      _array_dam = _nukepos nearObjects ["Man", nuke_destruction_ext];
      {_x setdamage 0.7} forEach _array_dam;
  
      _array_dam = _nukepos nearObjects ["Land", nuke_destruction_ext];
      {_x setdamage 0.8} forEach _array_dam;

     _array_dam = _nukepos nearObjects ["Ship", nuke_destruction_ext];
     {_x setdamage 0.8} forEach _array_dam;

     _array_dam = _nukepos nearObjects ["Motorcycle", nuke_destruction_ext];
     {_x setdamage 1} forEach _array_dam;

     _array_dam = _nukepos nearObjects ["Car", nuke_destruction_ext];
     {_x setdamage 0.8} forEach _array_dam;

     _array_dam = _nukepos nearObjects ["Air", nuke_destruction_ext];
     {_x setdamage 0.3} forEach _array_dam;

     _array_dam = _nukepos nearObjects ["Thing", nuke_destruction_ext];
     {_x setdamage 1} forEach _array_dam;

     _array_dam = _nukepos nearObjects ["Static", nuke_destruction_ext];
     {_x setdamage 1} forEach _array_dam;

     _array_dam = _nukepos nearObjects ["Strategic", nuke_destruction_ext];
     {_x setdamage 1} forEach _array_dam;

      _array_dam = _nukepos nearObjects ["NonStrategic", nuke_destruction_ext];
     {_x setdamage 1} forEach _array_dam;

     _array_dam = nil;

};