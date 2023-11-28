function damage_functions(){
		if to_gamepad_pressed(mb_left)
		{
			var enemy_on_range = battle_complex_click();
				if enemy_on_range
				{
					global.player.enemy_ranged = true;
					if global.player.attack_cooldown <= 1 
					{
						if global.player_stats[global.party.players[0]].style != 1 
						{
							if mouse_radius(self, 20, (global.player_stats[global.party.players[0]].hitrate/2)) 
							{
								//Se clicar no inimigo e estiver no Range:
								var dmg = battle_calculate_damage(global.player, self, global.player_index);
								var yy = y - sprite_height;
								var dmg_inst = instance_create_depth(x,yy,global.intern.depths.msg,_BATTLE_DMG);
								dmg_inst.dmg = dmg;
								dmg_inst.super = global.player;
								hp -= dmg;	
								damaged = true;
								attacked = true;
								// === //
							}
						}
						else {
							//Se clicar no inimigo e estiver no Range:
							var dmg = battle_calculate_damage(global.player, self, global.player_index);
							var yy = y - sprite_height;
							var dmg_inst = instance_create_depth(x,yy,global.intern.depths.msg,_BATTLE_DMG);
							dmg_inst.dmg = dmg;
							dmg_inst.super = global.player;
							hp -= dmg;	
							damaged = true;
							attacked = true;
							// === //				
						}
					}
				
				}
				else{
				}
		}		
		if !instance_exists(damageid) damageid = noone;
		if place_meeting(x,y,oDmgObject) {
			var object_skill = instance_place(x,y,oDmgObject);
			if object_skill.deal_damage and damageid != object_skill
			{
				attacked = true;
				var dmg = battle_calculate_object_damage(object_skill, self);
				var yy = y - sprite_height;
				var dmg_inst = instance_create_depth(x,yy,global.intern.depths.msg,_BATTLE_DMG);
				dmg_inst.dmg = dmg;
				dmg_inst.super = aim_target;
				hp -= dmg;	
				damaged = true;
				damageid = object_skill;
				// === //
			}
		}

	
	}

damage_functions();