scr_destruir("mobilias");

preco = [30, 15, 50, 50];
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

f_repositor = function()
{
	if (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), room_width/2-140, 280, room_width/2+250, 320))
	{
		draw_set_color(c_gray);
		draw_rectangle(room_width/2-140, 280, room_width/2+250, 320, false);
		draw_set_color(c_white);
		
		if (mouse_check_button(mb_left)) image_blend = c_gray;
		if (mouse_check_button_released(mb_left) and global.gold >= preco[2])
		{
			global.gold -= preco[2];
			global.mobilia[2]++;
		}
	}
	
	if (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), room_width/2-140, 340, room_width/2+250, 380))
	{
		draw_set_color(c_gray);
		draw_rectangle(room_width/2-140, 340, room_width/2+250, 380, false);
		draw_set_color(c_white);
		
		if (mouse_check_button(mb_left)) image_blend = c_gray;
		if (mouse_check_button_released(mb_left) and global.mobilia[2] > 0)
		{
			var _balcao = instance_create_depth(mouse_x, mouse_y, depth, obj_repositor);
			with (_balcao)
			{
				seguindo = true;
			}
			global.mobilia[2]--;
			instance_destroy();
		}
	}
	
	draw_sprite_ext(spr_repositor, 0, room_width/2-200, 330, 1.5, 1.5, 0, c_white, 1);
	draw_text(room_width/2-130, 280, "comprar repositor:\n$" + string(preco[2]));
	draw_text(room_width/2-130, 340, "posicionar repositor:\nquantidade de repositores: " + string(global.mobilia[2]));
}

f_faxineiro= function()
{
	if (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), room_width/2-140, 380, room_width/2+250, 420))
	{
		draw_set_color(c_gray);
		draw_rectangle(room_width/2-140, 380, room_width/2+250, 420, false);
		draw_set_color(c_white);
		
		if (mouse_check_button(mb_left)) image_blend = c_gray;
		if (mouse_check_button_released(mb_left) and global.gold >= preco[3])
		{
			global.gold -= preco[3];
			global.mobilia[3]++;
		}
	}
	
	if (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), room_width/2-140, 440, room_width/2+250, 480))
	{
		draw_set_color(c_gray);
		draw_rectangle(room_width/2-140, 440, room_width/2+250, 480, false);
		draw_set_color(c_white);
		
		if (mouse_check_button(mb_left)) image_blend = c_gray;
		if (mouse_check_button_released(mb_left) and global.mobilia[3] > 0)
		{
			var _balcao = instance_create_depth(mouse_x, mouse_y, depth, obj_faxineiro);
			with (_balcao)
			{
				seguindo = true;
			}
			global.mobilia[3]--;
			instance_destroy();
		}
	}
	
	draw_sprite_ext(spr_faxineiro, 0, room_width/2-200, 430, 1.5, 1.5, 0, c_white, 1);
	draw_text(room_width/2-130, 380, "comprar faxineiro:\n$" + string(preco[3]));
	draw_text(room_width/2-130, 440, "posicionar faxineiro:\nquantidade de faxineiros: " + string(global.mobilia[3]));
}