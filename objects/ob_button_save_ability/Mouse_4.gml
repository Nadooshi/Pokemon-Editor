/// @desc

// Inherit the parent event
event_inherited();

//ds_map_copy(current_attack_orig, current_action)

ds_map_add(ability_list, dedicated_map[? "name"], true)
ability_count = ds_map_size(ability_list)

ini_open(path)
	ini_write_string("abilities", dedicated_map[? "name"], ds_map_write(dedicated_map))
	ini_write_string("abilities", "ability_list", ds_map_write(ability_list))
ini_close()

// reload bini
bini_unload()
bini_load(path)

ds_map_copy(previous_map, dedicated_map)
