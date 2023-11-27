/// @description Damaged

if hp > 0 and damaged
{
	if !force_range {
		BATTLE_ATACK = irandom_range(BATTLE_BASIC*0.9,BATTLE_BASIC*1.2);
	}
	BATTLE_MIN_RANGE+=2;	
	if d>0 {
		if damage_type == 0 and !unstopable {
			if path_exists(path) path_delete(path);
			state_machine = "WAITING";
			d--;
		}
		else if damage_type == 1 and !unstopable {
			if path_exists(path) path_delete(path);
			state_machine = "WAITING";
			var strength = 2;
			var xxr = 0;
			var yyr = 0;
			xxr = (global.party.playersobj[battle_enemies_get_index()].x < x) ? 1 : -1;
			yyr = (global.party.playersobj[battle_enemies_get_index()].y < x) ? 1 : -1;
			if yyr == 1 and !place_meeting(x,y+strength,colisor) y+=strength
			else if yyr == -1 and !place_meeting(x,y-strength,colisor) y-=strength
			
			if xxr == 1 and !place_meeting(x+strength,y,colisor) x+=strength
			else if xxr == -1 and !place_meeting(x-strength,y,colisor) x-=strength
			d-=3;
		}
		image_blend = c_red;
		 // A função dessa variável é só pra dar um timerzinho no blendmode, e ficar mais visivel
	}
	else {
		//damage_type = 0;
		d = 15;
		damaged = false;
		image_blend = OWN_COLOR;
	}
}
else if hp <= 0 instance_destroy();

// You can write your code in this editor


