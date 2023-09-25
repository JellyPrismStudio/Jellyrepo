#region funcoes

image_blend = c_red;

#endregion

#region main
	main = function(){
		
		if position_meeting(mouse_x,mouse_y,id)
		{
			if mouse_check_button_pressed(mb_left)
			{
				if INGREDIENTS == INGREDIENTS_MAX
				{
				scale = 1.5;
				image_yscale = scale;
				image_xscale = scale;
				var CLICK2 = CLICK//irandom_range(CLICK/2,CLICK*2)
				global.points += CLICK2;
				var num = instance_create_depth(x,y,depth-1000,obj_numberpopup)
				num.number = CLICK2;
				INGREDIENTS = 0;
				}
				else INGREDIENTS++
			}	
		}

		if image_xscale > 1
		{
			scale = lerp(scale, 1, 0.3);
			image_yscale = scale;
			image_xscale = scale;
		}

		if nextlevel == 0 and global.points == 30
		{
			nextlevel = global.points;
			CLICK*=2;
	
		}
		else if nextlevel != 0
		{
			if global.points >= int64(nextlevel * 3)
			{
				nextlevel = global.points;
				global.points+=1;
				CLICK*=2;
			}	
		}
	}
#endregion

main();
PASSIVE = 10000;