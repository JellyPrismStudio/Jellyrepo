if live_call() return live_result;

if point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), 0,0,300,720) menu = true;
else menu = false;
global.baseGUI = menu;
if object[1] != -1 and !menu
{
	draw_sprite_ext(object_get_sprite(object[0]),0,window_mouse_get_x(), window_mouse_get_y(),2,2,0,c_white,0.7);
}

draw_sprite_ext(spr_BubbleSpeech2, 220, 200, 0, 1, 1, 0, c_white, 1)
draw_set_alpha(0.5);

draw_rectangle_color(0,0,300,720,#1a0004,#0d0103,#1a0004,#0d0103,false);
draw_set_alpha(1);

sdm(global.furniture);
if update == false
{
	j = 0;
	k = 0;
	init = (0+(24*page));
	for(i=init;i<array_length(global.furniture);i++)
	{
		
		draw_circle_color(100 + 50*j, 200+50*k, 20, c_orange, c_orange, false)
		
		var on_point = point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(),100 + 50*j - 20, 200+50*k - 20, 100 + 50*j + 20, 200 + 50*k + 20);
		if object[1] != i and !on_point draw_sprite_ext(object_get_sprite(global.furniture[i][0]),0,100 + 50*j,200+50*k,1,1,0,c_white,0.7);
		else {
			
			if on_point and object[1] != i draw_sprite_ext(object_get_sprite(global.furniture[i][0]),0,100 + 50*j,200+50*k,1,1,3,c_white,1);
			else draw_sprite_ext(object_get_sprite(global.furniture[i][0]),0,100 + 50*j,200+50*k,1,1,3,#C93C6B,1);
		}
		
		
		if point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(),100 + 50*j - 20, 200+50*k - 20, 100 + 50*j + 20, 200 + 50*k + 20)//gui_image_hitbox(100 + 50*j,200+50*k,object_get_sprite(global.furniture[i][0]))
		{
			
			//draw_rectangle();
			if mouse_check_button(mb_left)
			{
				object = [global.furniture[i][0], i];
			}
			var instlocal = instance_create_depth(-100,-100,10000,global.furniture[i][0])
			plus_text(150,580,global.furniture[i][1], c_orange, 0, 300, fa_center, fa_middle);
			plus_text(150,600,instlocal.nome, c_orange, 0, 300, fa_center, fa_middle);
			instance_destroy(instlocal)
		}
		if j < 2 j++
		else {
			k++;
			j = 0;
		}
		if i >= init + 23 break		
	}
	
	if point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(),200,620,220,640){
		if page < (ceil((array_length(global.furniture))/24-1))
		{
			if mouse_check_button_pressed(mb_left) page++
			plus_text(200,620,">",c_orange);	
		}
		else plus_text(200,620,">",c_gray);
	}
	else
	{
		if page < (ceil((array_length(global.furniture))/24-1)) plus_text(200,620,">",c_white);	
		else plus_text(200,620,">",c_gray);
	}
	
	if point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(),100,620,120,640){
		if page > 0
		{
			if mouse_check_button_pressed(mb_left) page--
			plus_text(100,620,"<",c_orange);
		}
		else plus_text(100,620,"<",c_gray);
	}
	else
	{
		if page > 0 plus_text(100,620,"<",c_white);	
		else plus_text(100,620,"<",c_gray);
	}
	plus_text(150,620,"page: " + string(page), c_white, 0, 200, fa_center);
	//update = true;
}


