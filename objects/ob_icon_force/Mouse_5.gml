/// @desc

value--
if value < 0 
	value=image_number-1
	
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
