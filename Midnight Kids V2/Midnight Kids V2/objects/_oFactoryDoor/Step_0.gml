if !global.cutscene.priority
{
	if time > 0 {
		time--
		sprite_index = noone
	}
	else{
		if !place_meeting(global.player.x,global.player.y, self) sprite_index = Sprite190;
	}
}