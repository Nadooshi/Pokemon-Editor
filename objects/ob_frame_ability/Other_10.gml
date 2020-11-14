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
	var _ini_string = bini_sections[? "abilities"][? name]
	if not is_undefined(_ini_string)
		ds_map_read(dedicated_map, _ini_string)
	else {
		show_message("Ability \"" + name + "\" not found!")
		ds_map_destroy(dedicated_map)
		instance_destroy()
		exit
	}
	
	event_inherited();
	

ds_map_destroy(dedicated_map)


