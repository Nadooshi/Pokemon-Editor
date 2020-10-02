/// @desc 

if is_undefined(ds_stack_top(room_stack))  {
	if show_question("Really exit?")
		game_end()
} else
	sc_goto_previous_room()

edit_mode = true

