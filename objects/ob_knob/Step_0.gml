/// @desc

if drag {
	dY = mouse_y - oY
	var dPos = round(dY / pos_range)
	position = clamp(oPos+dPos, 0, pos_count)
	oY = oY + max(0, abs(dY) - reg_range) * sign(dY)
}

value = min_value + position * step
caption = string(value)

ds_map_set(current_action, parameter_name, value)
event_perform(ev_other, ev_user0)
