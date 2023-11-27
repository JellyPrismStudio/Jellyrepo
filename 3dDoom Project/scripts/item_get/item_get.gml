/// @description item_get(item)
/// @param item
function item_get(argument0) {
	switch(argument0){
	    case obj_medkit:
	        global.hp = min(global.mhp,global.hp + 50)
	        sfx(snd_medkit)
	        with(obj_overlay){
	            drawhurt = true
	            hurtalpha= 0.25
	            hurtcolor= c_white
	        }
	    break
    
	    case obj_armor:
	        global.armor = min(global.marmor,global.armor + 50)
	        sfx(snd_armor)
	        with(obj_overlay){
	            drawhurt = true
	            hurtalpha= 0.25
	            hurtcolor= c_white
	        }
	    break
    
	    case obj_ammo_pistol:
	        sfx(snd_ammo)
	        ammo_get(wp_PISTOL,1)
	    break
    
	    case obj_ammo_machinegun:
	        sfx(snd_ammo)
	        ammo_get(wp_MACHINEGUN,1)
	    break
	}




}
