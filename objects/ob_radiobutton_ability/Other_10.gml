/// @desc

// Inherit the parent event
event_inherited();

var _group_index = group_index
var _value = ds_map_find_value(dedicated_map, parameter_name)
with ob_radiobutton_ability
if group_index = _group_index {
	down = (index == _value)
	image_blend = down ? c_gray : c_white
}		

