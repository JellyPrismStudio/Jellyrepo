/// @description (Re)Define lights
/// @param Re
if(instance_exists(parent_camera)){
    var c, ap;
    ap = ds_priority_create()
    with(parent_lightsource){
        ds_priority_add(ap,id,point_distance_3d(x,y,z,parent_camera.x,parent_camera.y,parent_camera.z))
    }
    for(c = 0;c < min(8,ds_priority_size(ap));c += 1){
        with(ds_priority_find_min(ap)){
            if(directional){
                d3d_light_define_direction(c,dx,dy,dz,color)
            }
            else{
                d3d_light_define_point(c,x,y,litez,r,color)
            }
        }
        ds_priority_delete_min(ap)
        d3d_light_enable(c,true)
    }
    for(c = c/*Yup, continue from that value*/;c < 8;c += 1){
        d3d_light_enable(c,false)
    }
    ds_priority_destroy(ap)
}

/* */
/*  */
