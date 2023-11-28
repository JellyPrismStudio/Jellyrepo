if !deactivate_range {
	if BATTLE_RANGE <= BATTLE_MAX_RANGE
	{
		BATTLE_RANGE = BATTLE_MIN_RANGE;
	
	}
	else if BATTLE_RANGE > BATTLE_MAX_RANGE
	{
		BATTLE_RANGE = BATTLE_MAX_RANGE;
	
	}
	range_alarm_aux = false;
	attacked = false;
	attacked_aux = false;
}