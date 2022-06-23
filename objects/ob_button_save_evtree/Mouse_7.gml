/// @desc

// Inherit the parent event
event_inherited();

var _s = ""

ini_open(path)
	var _name = ds_map_find_first(evolution_tree)
	while not is_undefined(_name) {
		_s = string_replace_all(json_stringify(evolution_tree[? _name]), "\"", "'")
//		show_message(_s)
		ini_write_string("evolution_tree", _name, _s)
		
		_name = ds_map_find_next(evolution_tree, _name)
	}
ini_close()

bini_unload()
bini_load(path)

