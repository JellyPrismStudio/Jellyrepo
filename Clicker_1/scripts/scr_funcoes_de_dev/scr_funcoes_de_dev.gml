// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_funcoes_i(){

}


/////////////////////////////////////////////
	main = function(){
		///
		f_fragmento_1();
		f_fragmento_2();
		
	}

main();

f_fragmento_1 = function()
{
	novo_y++;	
	draw_text();
	global.y = +1;
	show_debug_message(global.y);
	var _yy = global.y + novo_y;
	if place_meeting(0,0,id);
	y = _yy;
	draw_sprite(1,1,0,0);
}

f_fragmento_2 = function()
{
	novo_y++;	
	draw_text();
	if place_meeting(0,0,id);
	y = _yy;
	draw_sprite(1,1,0,0);
	global.y = +1;
	show_debug_message(global.y);
	var _yy = global.y + novo_y;
}