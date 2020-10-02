/// @desc

// Inherit the parent event
event_inherited();

value++
if value > image_number-1
	value = 0
	
switch (index) {
	case 0: {
		current_pokemon[? parameter_name] = value
		event_perform(ev_other, ev_user0)
		break;
	}	
	case 1: {
		current_action[? parameter_name] = value
		event_perform(ev_other, ev_user0)
		break;
	}
}
