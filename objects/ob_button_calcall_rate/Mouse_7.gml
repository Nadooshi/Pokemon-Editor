event_inherited();

var _action_names = sc_map_to_list(action_list)
var _actions = ds_list_create()

var _rating = 0

var _action = noone
var _ability = ds_map_create()

for (var i=0; i<ds_list_size(_action_names); i++) {
	_action = ds_map_create()
	ds_map_read(_action, bini_sections[? "actions"][? _action_names[| i]])
	_rating = sc_rate_action(_action, _ability)
	ds_map_set(_action, "rating", _rating)
	ds_list_add(_actions, _action)
}

var _t = get_timer()
ini_open(path)
for (var i=0; i<ds_list_size(_actions); i++) 
	ini_write_string("actions", _actions[| i][? "name"], ds_map_write(_actions[| i]))
ini_close()
show_message("Saving: " + string_format((get_timer()-_t)/1000000, 0, 3)+" s")
//reload bini
_t = get_timer()
bini_unload()
bini_load(path)
show_message("Loading: " + string_format((get_timer()-_t)/1000000, 0, 3)+" s")

for (var i=0; i<ds_list_size(_actions); i++)
	ds_map_destroy(_actions[| i])
	
ds_list_destroy(_actions)

