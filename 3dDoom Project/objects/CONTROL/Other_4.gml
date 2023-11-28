/// @description Init stuff
d3d_start()
//instance_deactivate_all(true)
if(!instance_exists(TERRAINCONTROL)){
    terrain_init()
    if(global.terrainfloor){
        instance_create(0,0,TERRAINCONTROL)
    }
    if(global.terrainceil){
        instance_create(0,0,TERRAINCEILCONTROL)
    }
    n = instance_create(x,y,obj_player)
    n.z = z
    instance_create(0,0,obj_overlay)
    instance_create(0,0,obj_mode7drawingstart)
}
with(obj_deco1){
    //Snap to terrain
    z = terrain_floor_get_z(x,y)
    event_user(0)
}
//instance_activate_all()


with(parent_wall){
    event_user(1)
}

