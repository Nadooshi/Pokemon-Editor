/// @desc 

// Inherit the parent event
event_inherited();

dedicated_map = ds_map_create()
var _name = ds_map_find_first(ability_list)
var _fixed_biome

ini_open(path)
while not is_undefined(_name) {
	ds_map_read(dedicated_map, bini_sections[? "abilities"][? _name])
	_fixed_biome = dedicated_map[? "biome"] - 1
	if _fixed_biome<0
		_fixed_biome += _ELEMENTAL.count
	show_debug_message(
		"biome was = " + string(dedicated_map[? "biome"]) + 
		" fixed into -> " + string(_fixed_biome)
	)
	dedicated_map[? "biome"] = _fixed_biome
	ini_write_string("abilities", dedicated_map[? "name"], ds_map_write(dedicated_map))
	_name = ds_map_find_next(ability_list, _name)
}
ini_close()
ds_map_destroy(dedicated_map)

bini_unload()
bini_load(path)

room_restart()

