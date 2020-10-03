/// @desc Update

// Inherit the parent event

if parameter_name != "" {
	name = ds_map_find_value(dedicated_map, parameter_name)	
}

if is_undefined(name) or name = "" {
	// no name
	instance_destroy()
	exit
}

// all right
dedicated_map = ds_map_create()

	ds_map_read(dedicated_map, bini_sections[? "abilities"][? name])
	
	event_inherited();
	

ds_map_destroy(dedicated_map)


