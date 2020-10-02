/// @desc

// Inherit the parent event
event_inherited();

var _group_index = group_index
var _value = ds_map_find_value(current_pokemon, parameter_name)
with ob_radiobutton_pokemon
if group_index = _group_index {
	down = (index == _value)
	image_blend = down ? c_gray : c_white
}		

