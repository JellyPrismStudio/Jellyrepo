/// @description init_weapon(id,name,shootscript,autofire,reloadspeed,hudsprite,clipsize,ammomax)
/// @param id
/// @param name
/// @param shootscript
/// @param autofire
/// @param reloadspeed
/// @param hudsprite
/// @param clipsize
/// @param ammomax
function init_weapon(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8) {
	global.weapon_data[argument0,wpd_NAME]           = argument1
	global.weapon_data[argument0,wpd_SHOOTSCRIPT]    = argument2
	global.weapon_data[argument0,wpd_AUTOFIRE]       = argument3
	global.weapon_data[argument0,wpd_RELOADTIME]     = argument4
	global.weapon_data[argument0,wpd_HUDSPRITE]      = argument5
	global.weapon_data[argument0,wpd_RELOADSPRITE]   = argument6
	global.weapon_data[argument0,wpd_CLIPSIZE]       = argument7
	global.weapon_data[argument0,wpd_STOREDAMMOMAX]  = argument8



}
