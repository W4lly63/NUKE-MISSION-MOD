

diag_log format ["Rad Crates PBO start..."];

call compile preprocessFileLineNumbers "\x\addons\rad_crates\content\spawncrates.sqf";
call compile preprocessFileLineNumbers "\x\addons\rad_crates\content\nuke\fn_init_pre.sqf";
