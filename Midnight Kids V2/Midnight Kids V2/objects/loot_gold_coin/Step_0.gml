/// @description Insert description here
xx = lerp(xx,0,0.002);
yy = lerp(yy,0,0.002);

if !place_meeting(x+xx,y+yy,ColliderOne){
	x += xx;
	y += yy;
}
kdepth_sort();

if kget_radius(self,35,false,true,false,global.player) {
	add_item_to_inv(global.itens.COIN,1,"code_gold_coin");
	instance_destroy();
}
// You can write your code in this editor


