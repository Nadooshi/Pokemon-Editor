/// @desc
caption = "<none>"
if parameter_name != ""
if variant_count > 0 {
	value = ds_map_find_value(dedicated_map, parameter_name)
	if is_undefined(value) value=0
	variant_index = sc_find_in_array(variant_value, value)
	if variant_index >= 0
		caption = variant_text[variant_index]
		
	if instance_exists(dependent_object)
	with dependent_object
		event_perform(ev_other, ev_user0)
}
