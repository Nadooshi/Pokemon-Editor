/// @desc

// Inherit the parent event
event_inherited();

ds_map_delete(ability_list, parent.name)
ability_count = ds_map_size(ability_list)

parent.image_alpha = 0.25
for (var i=0; i<parent.ui_objects_count; i++) 
	parent.ui_objects[i].image_alpha = 0.25
	
ini_open(path)
	ini_write_string("abilities", "ability_list", ds_map_write(ability_list))
ini_close()

// reload bini
bini_unload()
bini_load(path)

instance_destroy()

