/// globalvar_save(name, value)
//
// Saves the given value as a global variable with the given name.
//
// Arguments:
// - name: the name of the global variable
// - value: the value to be saved
//
function globalvar_save(name, value) {
    var data = ds_map_create();
    ds_map_add(data, "value", value);
    var file = file_text_open_write(name + ".json");
    file_text_write_string(file, json_encode(data));
    file_text_close(file);
}

/// globalvar_load(name, default_value)
//
// Loads the value of a global variable with the given name.
// If the variable does not exist, the default value is returned.
//
// Arguments:
// - name: the name of the global variable
// - default_value: the default value to be returned if the variable does not exist
//
// Returns: the value of the variable, or the default value if it does not exist
//
function globalvar_load(name, default_value) {
    var file = file_text_open_read(name + ".json");
    if (file != -1) {
        var json = file_text_read_string(file);
        file_text_close(file);
        var data = json_decode(json);
        if (data != undefined && ds_map_exists(data, "value")) {
            return data[? "value"];
        }
    }
    return default_value;
}
