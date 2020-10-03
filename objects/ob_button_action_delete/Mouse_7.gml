/// @desc

// Inherit the parent event
event_inherited();

ds_map_delete(action_list, parent.name)
action_list_count = ds_map_size(action_list)

parent.image_alpha = 0.25
for (var i=0; i<parent.ui_objects_count; i++) 
	parent.ui_objects[i].image_alpha = 0.25
	
ini_open(path)
	ini_write_string("actions", "action_list", ds_map_write(action_list))
ini_close()

// reload bini
bini_unload()
bini_load(path)

instance_destroy()

