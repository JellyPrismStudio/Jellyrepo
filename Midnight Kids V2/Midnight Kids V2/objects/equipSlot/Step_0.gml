user = global.party.players[global.menu.equippage];
equipid = global.inventory[index].equip;
equipped = global.player_stats[user].equip[equipid];
sprite_index = global.inventory[index].icon;
image_index = global.inventory[index].iconid;
if position_meeting(mouse_x,mouse_y,self){
	if !soundover play_audio("SFX",global.sounddb.menupop2,0,0,global.config.sound_volume)
	soundover = true;
	if to_gamepad_pressed(mb_left){
		if global.player_stats[user].equip[equipid] != -1{
			global.player_stats[user].atack		 -= global.player_stats[user].equip[equipid].atribute[0];
			global.player_stats[user].def		 -= global.player_stats[user].equip[equipid].atribute[1];
			global.player_stats[user].magic		 -= global.player_stats[user].equip[equipid].atribute[2];
			global.player_stats[user].crit		 -= global.player_stats[user].equip[equipid].atribute[3];
			global.player_stats[user].evasion	 -= global.player_stats[user].equip[equipid].atribute[4];
			global.player_stats[user].hitrate	 -= global.player_stats[user].equip[equipid].atribute[5];
			global.player_stats[user].mhp		 -= global.player_stats[user].equip[equipid].atribute[6];
			global.player_stats[user].msp		 -= global.player_stats[user].equip[equipid].atribute[7];
			var _store = global.player_stats[user].equip[equipid];
			global.player_stats[user].equip[equipid] = global.inventory[index];
			global.inventory[index] = _store;
			super.equip[i] = _store;
			equip_equipiment();
			}
		else {
			global.player_stats[user].equip[equipid] = global.inventory[index];
			global.inventory[index] = 0;
			global.inventoryunit[index] = 0;
			refresh_equip_menu();
			equip_equipiment();
		}		
	}
}
else soundover = false;

if global.inventory[index] == 0 instance_destroy();