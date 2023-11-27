/// @description Insert description here
xx = lerp(xx,0,0.002);
yy = lerp(yy,0,0.002);

if !place_meeting(x+xx,y+yy,ColliderOne){
	x += xx;
	y += yy;
}

if kget_radius(self,35,false,true,false,global.player) {
	add_item_to_inv(global.itens.POTION_SMALL,1,"code_small_pot");
	instance_destroy();
}

