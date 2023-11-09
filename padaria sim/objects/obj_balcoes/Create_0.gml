preco = 100;

f_balcoes = function()
{
	if (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), room_width/2-250, 220, room_width/2+250, 280))
	{
		draw_set_color(c_gray);
		draw_rectangle(room_width/2-250, 220, room_width/2+250, 280, false);
		draw_set_color(c_white);
		
		if (mouse_check_button(mb_left)) image_blend = c_gray;
		if (mouse_check_button_released(mb_left) and global.gold >= preco)
		{
			global.gold -= preco;
			global.balcoes++;
		}
	}
	
	if (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), room_width/2-250, 320, room_width/2+250, 380))
	{
		draw_set_color(c_gray);
		draw_rectangle(room_width/2-250, 320, room_width/2+250, 380, false);
		draw_set_color(c_white);
		
		if (mouse_check_button(mb_left)) image_blend = c_gray;
		if (mouse_check_button_released(mb_left) and global.balcoes > 0)
		{
			var _balcao = instance_create_depth(mouse_x, mouse_y, depth, obj_balcao);
			with (_balcao)
			{
				seguindo = true;
			}
			global.balcoes--;
			instance_destroy();
		}
	}
	
	draw_sprite_ext(spr_balcao, 0, room_width/2, 130, 1.5, 1.5, 0, c_white, 1);
	draw_set_halign(fa_center);
	draw_text(room_width/2, 230, "comprar balcao:\n$" + string(100));
	draw_text(room_width/2, 330, "posicionar balcao:\nquantidade de balcoes: " + string(global.balcoes));
	draw_set_halign(-1);
}