/// @desc

if editing
if parameter_name != "" {
	value = sc_normalize_string(keyboard_string)
	ds_map_set(current_item, parameter_name, value)
	event_perform(ev_other, ev_user0)
}

editing = false

image_blend = c_white
