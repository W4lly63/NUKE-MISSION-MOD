//  code by W4lly63


Bomb=
{    
//---------------bomb---------------------


    while {true} do
        {
		    waitUntil {
              ((randomTimeBomb select 0) == 1 )
            };
			
			nukepos= (randomTimeBomb select 1);
			
			//----start alarm-----------------------
			hint "RADIATIONZONE EXPLOSION IN 60 SEC:";
		        waitUntil {
				    ((randomTimeBomb select 0) == 2)
			    };
				//----------start nuke----------------
			    if((randomTimeBomb select 0) == 2)then{
			       [nukepos] execVM "scripts\nuke\nuke.sqf";		    
			    };	
			
        };

//------------------------------------------------------------------
};
