scr_destruir("funcionarios");

pagina = 0;
pagina_max = 2;

f_funcionarios = function()
{
	var _list = ds_list_create();
	collision_rectangle_list(0, 0, room_width, room_height, obj_repositor, false, true, _list, false);
	
	for (var i = 7*pagina; i < clamp(ds_list_size(_list), pagina*7, (pagina+1)*7); i++;)
	{
		var _obj = ds_list_find_value(_list, i);
		draw_sprite(spr_repositor, 0, room_width/2-240, 100+75*(i-floor(i/7)*7));
		draw_line(room_width/2-300, 60+75*(i-floor(i/7)*7), room_width/2+300, 60+75*(i-floor(i/7)*7));
		draw_text(room_width/2-200, 55+75*(i-floor(i/7)*7), "nome: " + _obj.nomes[_obj.idd]);
		draw_text(room_width/2-200, 65+75*(i-floor(i/7)*7), "xp: " + string(global.e_xp[_obj.idd]));
	}
	
	ds_list_clear(_list);
	ds_list_destroy(_list);
}