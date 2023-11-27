function unstuck(){
	if place_meeting(x,y,colisor){
	for(i=-10;i<10;i++){
		if !place_meeting(x + i,y,colisor) {
				x += i;
				break
			}
		else if !place_meeting(x,y + i,colisor) {
				y += i;
				break;
			}
		}
	}
}

/////////////////////////////////////////////

if hp > 0 and damaged
{
	global.party.ultimate += 0.02;
	if !force_range {
		VIEW_RANGE = irandom_range(VIEW_BASIC*1.3,VIEW_BASIC*1.8);
		//BATTLE_ATACK = irandom_range(BATTLE_BASIC*0.9,BATTLE_BASIC*1.2);
	}
	BATTLE_MIN_RANGE+=2;	
	if d>0 {
		if damage_type == 0 and !unstopable {
			if path_exists(path) path_delete(path);
			state_machine = "WAITING";
			d--;
		}
		else if damage_type == 1 and !unstopable and global.enemy_stats[myid].pull {
			if path_exists(path) path_delete(path);
			state_machine = "WAITING";
			var strength = 4;
			var xxr = 0;
			var yyr = 0;
			xxr = (global.party.playersobj[battle_enemies_get_index()].x < x) ? 1 : -1;
			yyr = (global.party.playersobj[battle_enemies_get_index()].y < x) ? 1 : -1;
			if yyr == 1 and !place_meeting(x,y+strength,colisor) and !place_meeting(x,y+strength,colisorEnemy) y+=strength
			else if yyr == -1 and !place_meeting(x,y-strength,colisor) and !place_meeting(x,y-strength,colisorEnemy) y-=strength
			
			if xxr == 1 and !place_meeting(x+strength,y,colisor) and !place_meeting(x+strength,y,colisorEnemy) x+=strength
			else if xxr == -1 and !place_meeting(x-strength,y,colisor) and !place_meeting(x-strength,y,colisorEnemy) x-=strength
			d-=5;
		}
		else
		{
			d-=2;
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

//unstuck()


// You can write your code in this editor


