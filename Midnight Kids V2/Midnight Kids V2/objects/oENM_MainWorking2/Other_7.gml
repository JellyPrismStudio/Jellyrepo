if sprite_index == CustomAttackSprite {
	if on_attack_range create_damage(aim_target);
	sprite_index = spr_index;
	attack_aux = false;
	spr_attack_aux = false;
	spr_aux = false;
	new_attack_cooldown = attack_cooldown;
	force_stop = false;
	grant_stop = false;
}