function save_file(name, variable)
{
	var data_json = encrypt_file(json_stringify(variable));
	var file = file_text_open_write(global.config.directory + name);
	file_text_write_string(file, data_json);
	file_text_close(file);	
}

function load_file(name, variable)
{
	if file_exists(global.config.directory + name){
		try{
			var file = file_text_open_read(global.config.directory + name);
			var json_string = decrypt_file(file_text_read_string(file));
			
			file_text_close(file);
			variable_global_set(variable, json_parse(json_string));
		}
		catch(error)
		{
		
		}
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