class CfgPatches {
	class rad_crates {
		units[] = {};
		weapons[] = {};
		requiredVersion = 0.1;
		requiredAddons[] = {};
	};
};

class CfgFunctions {
	class RADC {
		class RadCrates {
			file = "x\addons\rad_crates\init";
			class init {
				preInit = 1;
			};
		};
	};
};