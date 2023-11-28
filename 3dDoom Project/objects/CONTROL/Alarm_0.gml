/// @description Deactivation
alarm[0] = 8
if(instance_exists(parent_camera)){
    instance_deactivate_all(true)
    instance_activate_object(parent_active)
    instance_activate_region(parent_camera.x - xin,parent_camera.y - yin,2*xin,2*yin,true)
}

