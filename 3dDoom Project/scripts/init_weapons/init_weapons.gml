/// @description init_weapons()
function init_weapons() {

	//Preallocate array
	for(c = 0;c < WEAPON_MAX;c++){
	    for(d = 0;d < WEAPONDATA_MAX;d++){
	        global.weapon_data[c,d] = NONE
	    }
	    global.weapon_data[c,wpd_NAME] = ""
	    global.ammo[c] = NONE//Number of extra clips saved up
	    global.clip[c] = 0   //Number of bullets currently in the clip
	}

	//Actually set up
	//          Id                      Name                        Shootscript                     Autofire    Reloadspeed     Hudsprite               Reloadsprite    Clipsize    AmmoMax
	init_weapon(wp_UNARMED,             "Unarmed",                  NONE,                           false,      0,              NONE,                   spr_hud_reload, NONE,       NONE)
	init_weapon(wp_PISTOL,              "Pistol",                   ss_pistol,                      false,      90,             spr_hud_pistol,         spr_hud_reload, 10,         10)
	init_weapon(wp_MACHINEGUN,          "Machine Gun",              ss_machinegun,                  10,         90,             spr_hud_machinegun,     spr_hud_reload, 200,        3)




}
