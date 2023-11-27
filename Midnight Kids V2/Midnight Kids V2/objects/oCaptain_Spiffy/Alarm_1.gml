if !hidden{
	if object != false and instance_exists(object){
		if kget_radius(self,RADIUS/2,false,true,false,object){
		// Verifica se tá no range pra atacar
			var yy3 = object.y - object.sprite_height;
			var dmg_inst = instance_create_depth(object.x,yy3,global.intern.depths.over,_BATTLE_DMG);
			dmg_inst.dmg = captain_damage;
			dmg_inst.super = global.player;
			if object.hp > captain_damage{
				object.hp -= captain_damage;
				attacking = false;
			}
			else {
				object.hp -= captain_damage;
				attacking = false;
				object = false;
			}
		}
	}
	else if !instance_exists(object){
		object = false;
		attacking = false;
	}
	else {
	}
	attacking = false;
	sprite = 0;
} else {
	if get_object_on_radius(self,RADIUS,true,true,false,_OBJ_ENEMY) != false	{
		object = get_object_on_radius(self,RADIUS,true,true,false,_OBJ_ENEMY);
		hidden = false;
	}	
}