/// @desc 

// Inherit the parent event
event_inherited();

if edit_mode {
	// editing
	sc_clear_pokemon(current_pokemon)
	sc_load_pokemon(value, current_pokemon)
	ds_map_copy(previous_map, current_pokemon)
	ds_stack_push(map_stack, current_pokemon)
    ds_stack_push(previous_map_stack, previous_map)
	ds_stack_push(room_stack, room)
	room_goto(rm_editor)
} else {
	// selecting
	edit_mode = not edit_mode
	ref_write(edit_value, value)
	sc_goto_previous_room()
}

