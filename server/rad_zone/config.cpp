class CfgPatches {
	class rad_zone {
		units[] = {};
		weapons[] = {};
		requiredVersion = 0.1;
		requiredAddons[] = {};
	};
};

class CfgFunctions {
	class RADC {
		class RadZone {
			file = "x\addons\rad_zone\init";
			class init {
				preInit = 1;
			};
		};
	};
};