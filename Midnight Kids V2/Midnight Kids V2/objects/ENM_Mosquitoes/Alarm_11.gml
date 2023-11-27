if on_view(){
	instance_create_depth(x,y,-2,oFx_Explosion1);
	instance_create_depth(x,y,-1,ENM_Mosquito);
}
alarm_set(11,irandom_range(800,1200));