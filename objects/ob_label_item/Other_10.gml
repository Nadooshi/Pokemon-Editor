/// @desc Update
caption = ""
if parameter_name != "" {
	value = ds_map_find_value(current_item, parameter_name)

	caption = string(value)
}

