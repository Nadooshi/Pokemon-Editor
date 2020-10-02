/// @desc Init
init = true

if not is_undefined(ds_map_find_value(dedicated_map, parameter_name))
	value = ds_map_find_value(dedicated_map, parameter_name)
else
	value = 0
	
caption = string(ceil(value*0.01))
