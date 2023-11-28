if(instance_exists(obj_player)){
    ztop = median(zmin,zmax,zmin + (zmax-zmin)*(x+64-(obj_player.x + obj_player.xspeed))/sprite_width + BIGGESTHURDLEWALK - 2)
    zbottom = ztop - 1
}

