/// @description ammo_get(weapon,amount)
/// @param weapon
/// @param amount
function ammo_get(argument0, argument1) {
	if(global.ammo[argument0] <> NONE){
	    global.ammo[argument0] = min(global.ammo[argument0] + argument1,global.weapon_data[argument0,wpd_STOREDAMMOMAX])
	}
	else{
	    global.ammo[argument0] = argument1-1
	    global.clip[argument0] = global.weapon_data[argument0,wpd_CLIPSIZE]
	    global.eq_weapon = argument0
	}



}
