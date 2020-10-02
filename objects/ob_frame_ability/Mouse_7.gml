/// @desc

if not edit_mode {
	// selecting
	edit_mode = not edit_mode
	ref_write(edit_value, name)
	sc_goto_previous_room()
}
