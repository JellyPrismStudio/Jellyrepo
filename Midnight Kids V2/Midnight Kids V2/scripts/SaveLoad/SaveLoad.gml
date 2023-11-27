function save_file(name, variable)
{
	var data_json = json_stringify(variable);
	var file = file_text_open_write(global.config.directory + name);
	file_text_write_string(file, data_json);
	file_text_close(file);	
}

function load_file(name, variable)
{
	if file_exists(global.config.directory + name){
		try{
			var file = file_text_open_read(global.config.directory + name);
			var json_string = file_text_read_string(file);
			file_text_close(file);
			variable_global_set(variable, json_parse(json_string));
		}
		catch(error)
		{
		
		}
	}
}

function save_game(){
	if instance_exists(global.player){
		
	}	
	
	// Nesse arquivo vc coloca tudo o que quer salvar.
	global.save = {
		main: global.player,
		sconfig: global.config,
		debug: global.debug,
		index: global.player_index,
		inventory: global.inventory,
		units: global.inventoryunit,	
		triggers: global.triggers,
		player: global.player_stats,
		party: global.party,
		menu_enbd: global.menuenabled,
		gold:	global.gold,
		sxx: global.player.x,
		syy: global.player.y,
		base: global.furniture,
		map: room,
	};
	
	var data_json = json_stringify(global.save);
	var file = file_text_open_write(global.config.directory + "save.json");
	file_text_write_string(file, data_json);
	file_text_close(file);	
}

function load_game(){
	var file = file_text_open_read(global.config.directory + "save.json");
	var json_string = file_text_read_string(file);
	file_text_close(file);
	global.save = json_parse(json_string);
	
	#region
		// Aqui você dá load
		global.gold = global.save.gold;
		global.player = global.save.main;
		global.config = global.save.sconfig;
		global.triggers = global.save.triggers;
		global.player_index = global.save.index;
		global.inventory = global.save.inventory;
		global.inventoryunit = global.save.units;
		global.player_stats = global.save.player;
		global.party = global.save.party;
		global.menuenabled = global.save.menu_enbd;
		global.furniture = global.save.base;
		//
	#endregion
	
	room = Loading;
	check_object_and_validate(global.player);
	room = global.save.map;
	
	
	check_object_and_validate(global.player);
	global.player.x = global.save.sxx;
	global.player.y = global.save.syy;
	alarm_set(0,3);
	global.player.image_blend = c_blue;
	
}
	
function save_options(){
	var data_json = json_stringify(global.config);
	var file = file_text_open_write(global.config.directory + "options.json");
	file_text_write_string(file, data_json);
	file_text_close(file);		
}
	
function load_options(){
	try{
		sdm("Loaded");
		var file = file_text_open_read(global.config.directory + "options.json");
		var json_string = file_text_read_string(file);
		file_text_close(file);
		global.config = json_parse(json_string);
		if !global.config.fullscreen
	    {
	        window_set_fullscreen(false);
	    }
	    else
	    {
	        window_set_fullscreen(true);
	    }
	}
	catch(error)
	{
		save_options()
	}	
}

function encrypt_file(file){	
	var inputString = file;
	var outputString = "";

	for (var i = 1; i <= string_length(inputString); i++) {
	    var currentChar = string_char_at(inputString, i);
	    var nextChar = chr(ord(currentChar) + 2);
	    outputString += nextChar;
	}
	
	return outputString
}

function decrypt_file(file){	
	var inputString = file;
	var outputString = "";

	for (var i = 1; i <= string_length(inputString); i++) {
	    var currentChar = string_char_at(inputString, i);
	    var nextChar = chr(ord(currentChar) - 2);
	    outputString += nextChar;
	}
	
	return outputString
}
	
function save_encrypted(){
	if instance_exists(global.player){
		
	}
	
	
	// Nesse arquivo vc coloca tudo o que quer salvar.
	global.save = {
		main: global.player,
		sconfig: global.config,
		debug: global.debug,
		index: global.player_index,
		inventory: global.inventory,
		units: global.inventoryunit,	
		triggers: global.triggers,
		player: global.player_stats,
		party: global.party,
		menu_enbd: global.menuenabled,
		gold:	global.gold,
		sxx: global.player.x,
		syy: global.player.y,
		map: room,
		furniture: global.furniture,
		base: global.base,
	};
	
	var data_json = encrypt_file(json_stringify(global.save));
	var file = file_text_open_write(global.config.directory + "save.json");
	file_text_write_string(file, data_json);
	file_text_close(file);	
}
	
function load_encrypted(){
	var file = file_text_open_read(global.config.directory + "save.json");
	var json_string = decrypt_file(file_text_read_string(file));
	file_text_close(file);
	global.save = json_parse(json_string);
	
	#region
		// Aqui você dá load
		global.gold = global.save.gold;
		global.player = global.save.main;
		global.config = global.save.sconfig;
		global.triggers = global.save.triggers;
		global.player_index = global.save.index;
		global.inventory = global.save.inventory;
		global.inventoryunit = global.save.units;
		global.player_stats = global.save.player;
		global.party = global.save.party;
		global.menuenabled = global.save.menu_enbd;
		global.furniture = global.save.furniture;
		global.base = global.save.base;
		//
	#endregion
	
	room = Loading;
	check_object_and_validate(global.player);
	room = global.save.map;
	
	
	check_object_and_validate(global.player);
	global.player.x = global.save.sxx;
	global.player.y = global.save.syy;
	alarm_set(0,3);
	global.player.image_blend = c_blue;
	
}