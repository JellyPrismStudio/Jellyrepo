function BattleRun(){
	BATTLE_getList();
	if _range		!= -1			BattleRange();
	if _attack		!= -1			BattleRange();
}
	
function BATTLE_getList(){
	 _battle_size = ds_list_size(BATTLE_CREATE);
	 _range = ds_list_find_index(BATTLE_CREATE, "RANGE");
	 _attack = ds_list_find_index(BATTLE_CREATE, "ATTACK");
}



////////////////////

function BattleRange(){
	if kget_radius(self.id,BATTLE_RANGE,false,true,true,global.player) and !pathing {
		pathing = true;
		state_machine = "ON_RANGE";
		alarm_set(0,10);
	}
	
}