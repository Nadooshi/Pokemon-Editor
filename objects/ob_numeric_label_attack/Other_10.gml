/// @desc Update
if parameter_name != "" 
	if not is_undefined(ds_map_find_value(current_action, parameter_name)) {
		value = real(ds_map_find_value(current_action, parameter_name))

	caption = string(value)
}

