if live_call() return live_result;
ystrength = 2;
if place_meeting(x,y, global.player)
{
	if to_gamepad_pressed("D")
	{
		sdm("DDD")
		global.player.y -= ystrength				
	}
	if to_gamepad_pressed("A")
	{
		sdm("AAA");

			
			global.player.y += ystrength		
		
	}	
}