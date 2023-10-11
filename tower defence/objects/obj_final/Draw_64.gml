lista = ds_list_create();
instance_place_list(x, y, obj_monstro_base, lista, false)draw_text(room_width-100, 10, string(ds_list_size(lista))+"/"+string(quantidade))
if (ds_list_size(lista) >= quantidade) show_message("pro-play, ganhou!");
ds_list_destroy(lista);