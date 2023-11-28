/// @description Set projection to the camera's projection & init fog
d3d_set_fog(true,c_black,128,global.darkness)
d3d_set_lighting(true)
d3d_light_define_ambient($804040)//c_dkgray)
draw_set_color(c_white)
if(instance_exists(parent_camera)){
    with(parent_camera){
        d3d_set_projection_ext(x,y,z+zdelta,x+lengthdir_x(10,direction),y+lengthdir_y(10,direction),z+lengthdir_y(10,ztilt)+zdelta,0,0,1,60,1.76,1,global.darkness) 
        cameradirection = direction - 90
    }
}

