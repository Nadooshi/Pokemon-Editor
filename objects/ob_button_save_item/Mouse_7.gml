/// @desc 

// Inherit the parent event
event_inherited();

ds_map_add(item_list, current_item[? "name"], true)

ini_open(path)
	ini_write_string("inventory", current_item[? "name"], ds_map_write(current_item))
	ini_write_string("inventory", "item_list", ds_map_write(item_list))
ini_close()

bini_unload()
bini_load(path)
