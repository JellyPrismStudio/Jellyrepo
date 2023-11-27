draw_self();
draw_set_halign(fa_center);
draw_set_font(RulerBattle);
if position_meeting(mouse_x,mouse_y,self){
	draw_text_color(x,y+20,"Equip",c_orange,c_orange,c_orange,c_orange,1);
}
else {
	draw_text(x,y,"");
}