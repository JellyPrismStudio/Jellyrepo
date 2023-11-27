/// @description Insert description here
// You can write your code in this edito
var col = c_white;
if(arrived == false) {
 col = c_white;
} else {
	
col = c_red;
}

draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle,col,1);