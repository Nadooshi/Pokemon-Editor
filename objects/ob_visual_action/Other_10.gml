/// @desc

value = ds_map_find_value(dedicated_map, parameter_name)

if not is_undefined(value) {
	var _spr = asset_get_index(value)
	if sprite_exists(_spr)	
		sprite_index = asset_get_index(value)
}

