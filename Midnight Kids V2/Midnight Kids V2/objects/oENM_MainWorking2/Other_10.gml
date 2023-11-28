function check_if_sprite_attack(){
	if sprite_index != CustomAttackSprite {
		//
				play_audio("SFX", sfxMosquitoeAttack, 0, 0, global.config.sound_volume)
				image_index = 0;
				sprite_index = CustomAttackSprite;
				image_index = 0;
				spr_aux = true;
				force_stop = true;
				grant_stop = true;
	}	
}

if on_attack_range{
	if !CustomAttack{
		if kget_radius(self.id,BATTLE_ATACK,false,true,true,global.party.playersobj[0]){
			if path_exists(path) path_delete(path);
			state_machine = "ON_ATTACK";
		}
		create_damage();
	}
	else {
		
		
		if spr_attack_aux == false {
			state_machine = "ON_ATTACK";			
			check_if_sprite_attack();
			look_to_direction(false);
			attack_aux = true;
			spr_attack_aux = true;
		}
		if kget_radius(self.id,BATTLE_ATACK,false,true,true,global.party.playersobj[0]){
			check_if_sprite_attack();
			look_to_direction(false);
			if path_exists(path) path_delete(path);
		}
	}
}
if !CustomAttack new_attack_cooldown = 102;
if !on_attack_range {
	
	
	
}