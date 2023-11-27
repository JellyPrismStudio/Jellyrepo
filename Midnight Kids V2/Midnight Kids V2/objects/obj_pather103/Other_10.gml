if kget_radius(self, BATTLE_ATACK,false,true,true,global.player){
	ANIMATION_COOLDOWN = 60;
	path_delete(path);
	path = path_add();
	pathing = false;
	state_machine = "";
	var object = global.player;
	var stats = global.player_stats[global.player_index];
	var dmg = battle_enemy_calculate_damage(self, self, global.player_index);
	/*if !variable_instance_exists(object, "BATTLE_DAMAGED") {
		variable_instance_set(object, "BATTLE_DAMAGED", );
	}*/
	var yy = object.y - object.sprite_height;
	var dmg_inst = instance_create_depth(object.x,yy,-1010001,_BATTLE_DMG);
	dmg_inst.dmg = dmg;
	dmg_inst.super = self;
	stats.hp -= dmg;
	if dmg > 0 object.damaged = true;
	PATHING_COOLDOWN = 100;
}
ALARM_DEFINE = false;
ALARM_ATTACK--;
PATHING_TRIGGER = false;