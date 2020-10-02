/// @desc

// Inherit the parent event
event_inherited();

set_down = not down
down = set_down

// allow all up checking
if not allow_all_up {
	var ok = false
	var _group_index = group_index
	with ob_speedbutton {
		if group_index = _group_index
		if down  {
			ok = true
			break
		}
		if ok break
	}
	if not ok {
		down = not set_down
	}
}

// setting value
var _value = 0
var _group_index = group_index
with ob_speedbutton {
	if group_index = _group_index
	_value += down ? index : 0
}
ds_map_set(current_pokemon, parameter_name, _value)

event_perform(ev_other, ev_user0)

