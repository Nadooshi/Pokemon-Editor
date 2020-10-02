function sc_goto_previous_room() {
	last_room = ds_stack_pop(room_stack)
	if is_undefined(last_room) or not room_exists(last_room)
		last_room = rm_start

	room_goto(last_room)



}
