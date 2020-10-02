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
ini_open(path)
	ds_map_read(dedicated_map, ini_read_string("abilities", name, ""))
	
	event_inherited();
	
ini_close()
ds_map_destroy(dedicated_map)


