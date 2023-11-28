//if live_call() return live_result;
/// @description Insert description here
mousex = window_mouse_get_x()
mousey = window_mouse_get_y()
draw_sprite_ext(Sprite102,0,0,0,2,2,0,c_white,1);
for (i=0;i<slots;i++)
{
	
	if point_in_rectangle(mousex, mousey, init_x, init_y + (i*spacing), init_x + width, init_y + (i*spacing) + height)
	{
		if to_gamepad_pressed(mb_left)
		{
			if i == 0 or i == slots - 1
			{
				selected = []
				sdm("Page");
				if i == 0 and page > pagemin page--;
				if i == slots - 1 and page < pagemax page++;
				
				for(a = 0; a<slots-1; a++)
				{
					array_push(selected, itens[a + page*(slots-2)])
				}
			}
			else
			{
				sdm(page, i);
			}
		}
	}
	if i == 0 or i == slots - 1
	{
		draw_rectangle(init_x, init_y + (i*spacing), init_x + width, init_y + (i*spacing) + height, true)	
		draw_set_valign(fa_middle);
		draw_set_halign(fa_center);
		draw_text(init_x + width/2, init_y + (i*spacing) + height/2, "Page");
		draw_set_valign(fa_top);
	}
	else
	{
		draw_rectangle(init_x, init_y + (i*spacing), init_x + width, init_y + (i*spacing) + height, true)	
		draw_set_valign(fa_middle);
		draw_text(init_x + 30, init_y + (i*spacing) + height/2, selected[i]);
		draw_set_valign(fa_top);
		
		draw_set_halign(fa_right)
		draw_text(init_x + width - 30, init_y + (i*spacing) + height/2, i - 1);
		draw_set_halign(fa_left)
	}
	
}
draw_set_halign(fa_right)
draw_set_font(DayDream_pt8);
draw_text(init_x + width, init_y + ((slots)*spacing), ("Pagina: " + string(page+1) + "/" + string(pagemax + 1)));
draw_set_halign(fa_left)
// You can write your code in this editor
