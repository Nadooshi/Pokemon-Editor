event_inherited();

var _action_names = sc_map_to_list(action_list)
var _rating = 0
var _action = ds_map_create()

ini_open(path)
for (var i=0; i<ds_list_size(_action_names); i++) {
	ds_map_clear(_action)
	ds_map_read(_action, bini_sections[? "actions"][? _action_names[| i]])
	
	_rating = sc_rate_action(_action)
	ds_map_set(_action, "rating", _rating)
	ini_write_string("actions", _action[? "name"], ds_map_write(_action))
}
ini_close()

//log rating
fname = file_text_open_write("log_all_actions.txt")

var _log = ""
for (var i = 0; i < ds_list_size(logging); i ++){
		
	_log = ds_list_find_value(logging, i)
	file_text_write_string(fname, _log)
	file_text_writeln(fname)

}
ds_list_clear(logging)
file_text_close(fname);


//reload bini
bini_unload()
bini_load(path)

ds_map_destroy(_action)

