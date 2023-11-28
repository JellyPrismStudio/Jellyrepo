//if live_call() return live_result;

if instance_exists(equipInvWindow) or instance_exists(itemWindowMenu) or instance_exists(skillWindowMenu) or instance_exists(statusWindowMenu) or instance_exists(Options) or instance_exists(BestiaryWindowMenu){
	notspawn = false;
	close_itens_main_menu();
	if !instance_exists(menuOffBackground) {
		inst1  = instance_create_layer(vx,vy,"Menu", menuOffBackground);
		inst1.depth+=10;
	}	
}
else{
	global.onmenu = false;
	global.can_move = true;
	close_itens_main_menu();
	instance_destroy();	
}