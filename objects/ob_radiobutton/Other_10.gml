/// @desc

var _group_index = group_index
var _value = ds_map_find_value(current_action, parameter_name)
with ob_radiobutton
if group_index = _group_index {
	down = (index == _value)
	image_blend = down ? c_gray : c_white
}		

