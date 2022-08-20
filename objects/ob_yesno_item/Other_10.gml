/// @desc

if ds_exists(current_item, ds_type_map) {
	value = ds_map_find_value(current_item, parameter_name)

	if not is_undefined(value) {
		var _no = (value != 0)
		image_index = _no ? 0 : 1
		image_alpha = _no ? 0.5 : 0.25
	}
}
