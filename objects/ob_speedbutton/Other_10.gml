/// @desc

// Inherit the parent event
event_inherited();

var _value = ds_map_find_value(current_action, parameter_name)
if is_undefined(_value)
	_value=0

var _group_index = group_index
with ob_speedbutton
if group_index = _group_index {
	down = (_value & index)
	image_blend = down ? c_gray : c_white
}

