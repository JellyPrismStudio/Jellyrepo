/// @description Jump to position
if(global.sx <> NONE && global.sy <> NONE){
    var ty = global.sy, tx = global.sx;
    bobstep     = global.bobstep
    direction   = global.sdir
    ztilt       = global.stilt
    
    if(global.terrain_compressed){
        tx = tx mod __background_get( e__BG.Width, 0 )
    }
    
    switch(global.roomentry){
        case entry_DOOR:
            n = instance_nearest(tx,ty,obj_doordestination)
            x = n.x + global.sdx
            y = n.y + global.sdy
            z = n.z + global.sdz
        break
        
        case entry_ELEVATOR_DOWN:
        break
        
        case entry_ELEVATOR_UP:
        break
    }
}


show_debug_message("x:"+string(x) + "   y:"+string(y) + "    z:"+string(z))

