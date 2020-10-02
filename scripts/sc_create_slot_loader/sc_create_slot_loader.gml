/// @arg x
/// @arg y
/// @arg name
function sc_create_slot_loader(argument0, argument1, argument2) {
	var _x = argument0
	var _y = argument1
	var _name = argument2
	var _id = noone

	with instance_create_layer(_x, _y, "Pokeballs", ob_slot) {
		image_xscale = 1.5
		image_yscale = 1.5
		image_speed = 0
		image_index = 1
	}
	with instance_create_layer(_x, _y, "Fireballs", ob_fireball) {
		image_xscale = 1.5
		image_yscale = 1.5
		image_alpha = 0.5
	}

	with instance_create_layer(_x, _y, "Clickable", ob_pokemon_icon) {
		hint = _name
		value = _name
		image_xscale = 2
		image_yscale = 2
		_id = id
	
	}
	with instance_create_layer(_x+20,_y-48, "Clickable", ob_rating_star) {
		title = _name
		caption = "0"
	}

	if edit_mode
	with instance_create_layer(_x+12, _y+12, "Clickable", ob_button_delete) {
		name = _name
		parent = _id
	}




}
