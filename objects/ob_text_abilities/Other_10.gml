/// @desc

caption = "<none>"
if parameter_name != "" {
	if ds_map_exists(dedicated_map, parameter_name)
	value = ds_map_find_value(dedicated_map, parameter_name)
	caption = string(value)
}

