

diag_log format ["Rad Crates PBO start..."];

call compile preprocessFileLineNumbers "\x\addons\rad_zone\content\spawncrates.sqf";
call compile preprocessFileLineNumbers "\x\addons\rad_zone\content\nuke\fn_init_pre.sqf";
