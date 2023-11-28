if i != -1{
	if atribute == "SP" and global.player_stats[global.party.players[i]].msp >= 99 {
		global.player_stats[global.party.players[i]].msp = 99;	
		lock = true;
	}



	if global.player_stats[global.party.players[i]].freepoints > 0 and !lock
	{
		if position_meeting(mouse_x,mouse_y,self){
		if to_gamepad_pressed(mb_left){
		
			/////////////////////////
			switch (atribute)
			{
			
			
			case "ATK":
				global.player_stats[global.party.players[i]].atack++;
			break;
			case "DEF":
				global.player_stats[global.party.players[i]].def++;
			break;
			case "HIT":
				global.player_stats[global.party.players[i]].hitrate++;
				global.player_stats[global.party.players[i]].aimrange += 1;
			break;
			case "CRI":
				global.player_stats[global.party.players[i]].crit++;
			break;	
			case "EVA":
				global.player_stats[global.party.players[i]].evasion++;
			break;	
			case "MAG":
				global.player_stats[global.party.players[i]].magic++;
			break;	
			case "HP":
				global.player_stats[global.party.players[i]].mhp = global.player_stats[global.party.players[i]].mhp + 5;
				//global.player_stats[global.party.players[i]].hp = global.player_stats[global.party.players[i]].mhp
			break;
			case "SP":
				if	global.player_stats[global.party.players[i]].msp >= 99 {
					global.player_stats[global.party.players[i]].freepoints++;
					global.player_stats[global.party.players[i]].msp = 99;
					lock = true;
				}
				else 
				{
					global.player_stats[global.party.players[i]].msp = global.player_stats[global.party.players[i]].msp + 2;
				}
			
				//global.player_stats[global.party.players[i]].sp = global.player_stats[global.party.players[i]].msp
			break;
		
			}	
			global.player_stats[global.party.players[i]].freepoints--;
		
		
		
		
			/////////////////////////
		
		}	
			image_blend = c_red;
	
		}else{
			image_blend = c_white;	
		}	
	
	
	}else image_blend = c_gray;
	}
else instance_destroy();