/// @desc
caption = "<none>"
if parameter_name != ""
if variant_count > 0 {
	value = ds_map_find_value(current_item, parameter_name)
	if is_undefined(value) value=0
	variant_index = sc_find_in_array(variant_value, value)
	if variant_index >= 0
		caption = variant_text[variant_index]
		
//	if instance_exists(dependent_object)
}
