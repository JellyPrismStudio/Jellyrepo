if(instance_exists(obj_player)){
    ztop = median(zmin,zmax,zmin + (zmax-zmin)*((obj_player.x + obj_player.xspeed) - x)/sprite_width + BIGGESTHURDLEWALK - 2)
    zbottom = ztop - 1
}

