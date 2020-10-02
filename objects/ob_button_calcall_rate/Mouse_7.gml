event_inherited();

var _action_names = sc_map_to_list(action_list)
var _actions = ds_list_create()

var _rating = 0

var _action = noone
var _ability = ds_map_create()

for (var i=0; i<ds_list_size(_action_names); i++) {
ini_open(path)
	_action = ds_map_create()
	ds_map_read(_action, ini_read_string("actions", _action_names[| i], ""))
	_rating = sc_rate_action(_action, _ability)
	ds_map_set(_action, "rating", _rating)
	ds_list_add(_actions, _action)
ini_close()
}

ini_open(path)
for (var i=0; i<ds_list_size(_actions); i++) 
	ini_write_string("actions", _actions[| i][? "name"], ds_map_write(_actions[| i]))
ini_close()


for (var i=0; i<ds_list_size(_actions); i++)
	ds_map_destroy(_actions[| i])
	
ds_list_destroy(_actions)

