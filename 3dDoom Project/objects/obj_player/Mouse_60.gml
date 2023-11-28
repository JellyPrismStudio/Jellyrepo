/// @description Change to previous weapon
if(!reloading){
    for(c = 1;c < WEAPON_MAX;c++){
        wp = (global.eq_weapon + WEAPON_MAX - c) mod WEAPON_MAX
        if(global.ammo[wp] <> NONE){
            global.eq_weapon = wp
            break
        }
    }
}

