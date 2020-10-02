/// @desc

if parameter_name != ""
if ds_exists(dedicated_map, ds_type_map)
	value = ds_map_find_value(dedicated_map, parameter_name)

if not is_undefined(value) {
	image_index = value
	hint = material_text[value]
}