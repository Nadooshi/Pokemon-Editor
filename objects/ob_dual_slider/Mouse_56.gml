/// @desc End drag

if not drag
	event_perform(ev_other, ev_user0)

drag = false

// set value
ds_map_set(current_action, parameter_name, value)
ds_map_set(current_action, parameter_name2, max_value - value)


