/// @desc 

// Inherit the parent event
event_inherited();

var _parent = parent.parent
_parent.value = value

ds_map_set(current_pokemon, _parent.parameter_name, value)

with _parent
	event_perform(ev_other, ev_user0)

with ob_popup_frame
	instance_destroy()
	
