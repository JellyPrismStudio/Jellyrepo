/// @description Insert description here
plyr.sprite_index = global.player_stats[global.party.players[0]].idlegraph;


if bl.pressed {
	invsize = array_length(global.inventory);
	refresh_item_menu();
	ymp = 0;
	yfix = 0;
	k = 0;
	j = 0;
	start_i += 9;
	page++;
	end_i = start_i - 8;
	invsize = array_length(global.inventory);
	value_i -= 9;
	event_user(0);
	bl.pressed = false;	
}
if br.pressed {
	invsize = array_length(global.inventory);
	refresh_item_menu();
	ymp = 0;
	yfix = 0;
	page--;
	k = 0;
	j = 0;
	start_i -= 9;
	end_i = start_i + 8;
	invsize = array_length(global.inventory);
	value_i += 9;
	event_user(0);
	br.pressed = false;	
}





// You can write your code in this editor



