/// @desc Update
caption = ""
if parameter_name != "" {
	value = ds_map_find_value(dedicated_map, parameter_name)

	caption = string(value)
	
}

