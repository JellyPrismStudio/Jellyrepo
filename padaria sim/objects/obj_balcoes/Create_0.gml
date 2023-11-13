preco = [100, 50];
pagina = 0;
pagina_max = 1;

f_balcoes = function()
{
	if (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), room_width/2-140, 80, room_width/2+250, 120))
	{
		draw_set_color(c_gray);
		draw_rectangle(room_width/2-140, 80, room_width/2+250, 120, false);
		draw_set_color(c_white);
		
		if (mouse_check_button(mb_left)) image_blend = c_gray;
		if (mouse_check_button_released(mb_left) and global.gold >= preco[0])
		{
			global.gold -= preco[0];
			global.mobilia[0]++;
		}
	}
	
	if (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), room_width/2-140, 140, room_width/2+250, 180))
	{
		draw_set_color(c_gray);
		draw_rectangle(room_width/2-140, 140, room_width/2+250, 180, false);
		draw_set_color(c_white);
		
		if (mouse_check_button(mb_left)) image_blend = c_gray;
		if (mouse_check_button_released(mb_left) and global.mobilia[0] > 0)
		{
			var _balcao = instance_create_depth(mouse_x, mouse_y, depth, obj_balcao);
			with (_balcao)
			{
				seguindo = true;
			}
			global.mobilia[0]--;
			instance_destroy();
		}
	}
	
	draw_sprite_ext(spr_balcao, 0, room_width/2-200, 130, 1.5, 1.5, 0, c_white, 1);
	draw_text(room_width/2-130, 80, "comprar balcao:\n$" + string(preco[0]));
	draw_text(room_width/2-130, 140, "posicionar balcao:\nquantidade de balcoes: " + string(global.mobilia[0]));
}

f_vaso = function()
{
	if (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), room_width/2-140, 180, room_width/2+250, 220))
	{
		draw_set_color(c_gray);
		draw_rectangle(room_width/2-140, 180, room_width/2+250, 220, false);
		draw_set_color(c_white);
		
		if (mouse_check_button(mb_left)) image_blend = c_gray;
		if (mouse_check_button_released(mb_left) and global.gold >= preco[1])
		{
			global.gold -= preco[1];
			global.mobilia[1]++;
		}
	}
	
	if (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), room_width/2-140, 240, room_width/2+250, 280))
	{
		draw_set_color(c_gray);
		draw_rectangle(room_width/2-140, 240, room_width/2+250, 280, false);
		draw_set_color(c_white);
		
		if (mouse_check_button(mb_left)) image_blend = c_gray;
		if (mouse_check_button_released(mb_left) and global.mobilia[1] > 0)
		{
			var _balcao = instance_create_depth(mouse_x, mouse_y, depth, obj_mobilia);
			with (_balcao)
			{
				seguindo = true;
			}
			global.mobilia[1]--;
			instance_destroy();
		}
	}
	
	draw_sprite_ext(spr_mobilia, 0, room_width/2-200, 230, 1.5, 1.5, 0, c_white, 1);
	draw_text(room_width/2-130, 180, "comprar vaso:\n$" + string(preco[1]));
	draw_text(room_width/2-130, 240, "posicionar vaso:\nquantidade de vasos: " + string(global.mobilia[1]));
}