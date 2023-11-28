/// @description Insert description here
//if place_meeting(x,y,oENM_Main) instance_destroy();

// You can write your code in this editor

if to_gamepad_click(mb_left) and global.party.players[0] == 3{
	change_audio("BGM3");
	var sound = 100;
}
else {
	change_audio("BGM3", -global.config.music_volume, 100);
	
}

// Loop que percorre todos os objetos da room
for (var i = 0; i < instance_number(oENM_Main); i++) {
    var obj = instance_find(oENM_Main,i);

    // Verifica se o objeto está colidindo com o retângulo de colisão
   if place_meeting(x,y,obj) {
        // Adiciona o ID do objeto à array
        if !find_value_on_array_bool(IDS,obj)
		{
			array_push(IDS, obj)
		}
    }
}

if place_meeting(x,y,global.party.playersobj[1]) and heal == false
{
	
		if global.player_stats[global.party.players[1]].hp < global.player_stats[global.party.players[1]].mhp
		{
			if array_length(IDS) > 0
			{
				global.player_stats[global.party.players[1]].hp += int64(global.player_stats[3].magic/(mult/3)) + array_length(IDS);
				battle_create_popup(global.party.playersobj[1], int64(global.player_stats[3].magic/(mult/3)) + array_length(IDS), true, global.player_stats[global.player_index])
			}
			else 
			{
				global.player_stats[global.party.players[1]].hp += int64(global.player_stats[3].magic/(mult/3));
				battle_create_popup(global.party.playersobj[1], int64(global.player_stats[3].magic/(mult/3)) + array_length(IDS), true, global.player_stats[global.player_index])
			}
			with (global.party.playersobj[1]) {
				cured = true;
			}
			clamp(global.player_stats[global.party.players[1]].hp,0,global.player_stats[global.party.players[1]].mhp);
			
		}
		if array_length(IDS) > 0 multd = floor(array_length(IDS)/2);
		else multd = 3;
		var mpl = global.player_stats[global.party.players[0]]
		if mpl.hp < mpl.mhp {
			mpl.hp += 1 * multd;
			if multd > 0 battle_create_popup(global.party.playersobj[0], 1 * multd, true, global.player_stats[3])
			clamp(mpl.hp, 0, mpl.mhp);
		}
		heal = true;
}