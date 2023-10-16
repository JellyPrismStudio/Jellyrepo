lista = ds_list_create();
instance_place_list(x, y, obj_monstro_base, lista, false)draw_text(room_width-100, 10, string(ds_list_size(lista))+"/"+string(quantidade))
if (ds_list_size(lista) >= quantidade)
{
	global.gold += 25+25*fase
	room_goto(scn_mapa);
	if (global.fase == fase)
	{
		global.gold += 50
		global.fase++;
	}
}
ds_list_destroy(lista);