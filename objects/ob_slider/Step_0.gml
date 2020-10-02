/// @desc

if drag {
	dX = mouse_x - oX
	var dPos = round(dX / pos_range)
	position = clamp(oPos+dPos, 0, pos_count)
}

value = min_value + position * step
curX = position * pos_range

