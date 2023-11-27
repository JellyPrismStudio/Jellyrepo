/// @description Insert description here
// You can write your code in this editor
zoomed=false;

cam_w=global.config.camera_width/2;
cam_h=global.config.camera_height/2;
cam_scale=2;
cam_smooth=0.1;

camera=camera_create_view(0,0,cam_w,cam_h);
view_set_camera(1,camera);