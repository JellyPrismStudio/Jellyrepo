function draw_events(){
	draw_path(path, x, y, 1);
	draw_set_halign(fa_center);
	draw_text(x,y+sprite_height,hp);
	draw_circle_color(x,y,ww*1 + sprite_width/2, c_orange, c_orange, true);
	kget_radius(self, BATTLE_RANGE,false,true,true,global.player);
}
	
draw_self();
ww = sprite_width;
hh = sprite_height;
//draw_events();
if	collision_circle(mouse_x, mouse_y, ww*1, self, false, false) image_blend = #d790b6;
else image_blend = OWN_COLOR;