function sc_cleanup_globals() {

	ds_stack_destroy(room_stack)
	ds_stack_destroy(map_stack)
	ds_stack_destroy(previous_map_stack)
	ds_stack_destroy(ref_stack)



}
