/// @desc

if not edit_mode {
	// selecting
	edit_mode = not edit_mode
	var _bindedactions = ref_read(edit_value)
	ds_map_add(_bindedactions, name, true)
	
	sc_goto_previous_room()
}
