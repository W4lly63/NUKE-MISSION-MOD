# NUKE-MISSION-MOD
Mission mod for Arma3 Epoch 
- Nuke zone mission 

NUKE-MISSION-MOD  (ARMA3 EPOCH)
inspired by some old arma2 mission mods 
(authors mentioned inside scripts)
code by W4lly63

ALPHA 0.01 Version.  (pre version - optimized 40%)
if someone want help / add /rework better 
contact me to giulfy@hotmail.com is welcome!!



Description/Features

- Ability to define a radioactive zone .
- Ability to define types of uniforms and helmets for reduce radioactivity damage.
- Inside Radioactive zone ash , winds and atmosphere effects .
- Mask and geiger counter sounds.
- Crates loots spawn in randomly places inside Rzone. (deleted and spawned again every 30 min if no one player near)

- Radioactive explosione with particleeffect at random time inside Rzone with damage of buildings ,vehicles,structures,players.
- Ability to define time, place and intensity of explosions.
- AI bots (not in this version)


INSTALLATION

- copy rad_zone.pbo  inside @EpochHive\addons
-  add to your mission \init.sqf this lines
- //Radiation Zone
- [] execVM "scripts\nuke\RadiationZone.sqf";
- [] execVM "scripts\nuke\starter.sqf";
		  
- add to your description.ext  sounds inside description.ext downloaded
- open your mission.sqm with eliteness and merge code of mission.sqm file inside downloaded files
- copy sounds folder in your mission and merge if u have one...
- copy nuke folder in your scripts folder if u have one or copy scripts\nuke folder if u dont have one..
DONE............
		
BE FILTERS

scripts.txt

- 17  !="HideObject _x"
- 48  !="player setDamage _damage;" !="_x setdamage 1" !="_x setdamage 0.7" !="_x setdamage 0.8"  !="_x setdamage 0.3"


publicvariable.txt


- 0  !="randomTimeBomb"		
