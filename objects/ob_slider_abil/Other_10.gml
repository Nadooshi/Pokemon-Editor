/// @desc Refresh

value = ds_map_find_value(current_ability, parameter_name)
if not is_undefined(value)
position = (value - min_value) / step


// set values from source object
if instance_exists(source_object) {
	with source_object event_perform(ev_other, ev_user0)
	var val = source_object.value
	if val > 0 
		max_value = val
	else
		max_value = 0
	
	pos_count = round((max_value - min_value) / step)
	pos_range = reg_range / pos_count
	position = clamp(position, min_value, max_value)
	value = clamp(value, min_value, max_value)
	oPos = position
}
