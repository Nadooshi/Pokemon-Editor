/// @desc

if editing {
	if keyboard_string = ""
		value = 0
	else
		value = real(string_digits(keyboard_string))
	
	ds_map_set(dedicated_map, parameter_name, value)
		
	event_perform(ev_other, ev_user0)
}

editing = false

image_blend = c_white
