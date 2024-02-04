 /// @description Insert description here

cursor_sprite = sprite_cursor2;
window_set_cursor(cr_none);

// Comentario
var file = "SystemManagementLog.ini";
room_name = string(room_get_name(room));
function run_sound(){
	
	
	
}

function run_basics(){
	
	#region LAYERS
	if !layer_exists("Setup")				layer_create(global.intern.depths.setup, "Setup");
	if !layer_exists("Messages")			layer_create(global.intern.depths.msg, "Messages");
	if !layer_exists("Menu")				layer_create(global.intern.depths.menu, "Menu");
	if !layer_exists("SystemInstances")		layer_create(global.intern.depths.system, "SystemInstances");
	instance_create_layer(0,0,"Setup",GridSetup);
	instance_create_layer(0,0,"Setup",GridSetupEnemy);
	instance_create_layer(0,0,"Setup",LanguageManager);
	global.onmenu = false;
	#endregion
	
	check_object_and_validate(_GLOBAL_CAMERA, 0, 0, true, "Setup");
	//check_object_and_validate(oCursor, 0, 0, true, "SystemInstances");
	
	#region PARTY	
	//check_object_and_validate(global.player, 743, 450, true, "Instances");
	if global.party.players[0] != -1 check_object_and_validate(global.party.playersobj[0], 743, 450, true, "Instances");
	
	alarm_set(1,1);
	#endregion
	
	
	
}


if room != TelaInicial run_basics();

switch (room){
		
		case TelaInicial:
		play_audio("BGM1",BGM_Title_Screen2,0,1,global.config.music_volume);
		add_text_to_log("\n===\nTela Inicial carregada pelo Manager", file);
		run_weather(1, 30, false, 0.3);
		//show_message("You're in tela inicial");
		//check_object_and_validate(_GLOBAL_CAMERA);
		break;
		
		case Room2:
		alarm_set(1,10);
		play_audio("BGM1",BGM_Quiet_Forest,0,1,global.config.music_volume);
		add_text_to_log("\n===\nRoom 2 carregado pelo Manager", file);
		break;

		case Forest1:
		alarm_set(1,10); 
		//play_audio("BGM1",BGM_Quiet_Forest,0,1,global.config.music_volume);
		add_text_to_log("\n===\Forest carregado pelo Manager", file);
		run_weather(0, 1, 1, 1);
		//text_on_view(global.camera.width/2,global.config.camera_height/2,"Sejam Bem-vindos, caros amigos! :)", 7, c_white, DayDream_pt8, fa_center);
		break
		
		case rDinersOut:
		alarm_set(1,10); 
		play_audio("BGM1", BGM_Ironwork, 0,1,global.config.music_volume);
		add_text_to_log("\n===\DinersOut carregado pelo Manager", file);
		run_weather(0, 3, true, 0.7);
		break
		
		case rDinersIn:
		alarm_set(1,10); 
		play_audio("BGM1", BGM_Mellow_Mind_Looping, 0,1,global.config.music_volume);
		add_text_to_log("\n===\DinersIn carregado pelo Manager", file);
		break
		
		case Factory01:
		//run_weather(12);
		break
		
		case rGasStation:
		alarm_set(1,10); 
		play_audio("BGM1",BGM_TheAncientForest,0,1,global.config.music_volume);
		add_text_to_log("\n===\GasStation carregado pelo Manager", file);
		run_weather(0, 1, true, 0.3);
		break
		
		case ROOM_TEMPLATE:
		alarm_set(1,10); 
		play_audio("BGM1",BGM_TheAncientForest,0,1,global.config.music_volume);
		add_text_to_log("\n===\Convenience carregado pelo Manager", file);
		run_weather(1, 10, true, 0.7);
		break
		
		case rGasConvenience:
		alarm_set(1,10); 
		play_audio("BGM1",BGM_TheAncientForest,0,1,global.config.music_volume);
		add_text_to_log("\n===\Convenience carregado pelo Manager", file);
		run_weather(1, 10, true, 0.7);
		break
		
		case rRepairShop:
		alarm_set(1,10); 
		play_audio("BGM1",BGM_TheAncientForest,0,1,global.config.music_volume);
		add_text_to_log("\n===\Convenience carregado pelo Manager", file);
		run_weather(1, 30, false, 0.7);
		break
		
		case Room10:
		alarm_set(1,10); 
		break
// You can write your code in this editor
}
