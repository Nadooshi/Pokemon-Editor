function sc_init_globals() {

	globalvar edit_mode;
	globalvar edit_value;
	globalvar room_stack;
	globalvar map_stack;
	globalvar previous_map_stack;
	globalvar ref_stack;
	edit_mode = true
	edit_value = noone
	room_stack = ds_stack_create()
	map_stack = ds_stack_create()
	previous_map_stack = ds_stack_create()
	ref_stack = ds_stack_create()

	ds_stack_clear(room_stack)
	ds_stack_clear(map_stack)
	ds_stack_clear(previous_map_stack)
	ds_stack_clear(ref_stack)

	globalvar last_room;
	last_room = noone



}
