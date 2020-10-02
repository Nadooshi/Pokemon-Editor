/// @desc

// Inherit the parent event
event_inherited();

if not slots_created {
	// read values
	var _sorted_list = ds_list_create(); ds_list_clear(_sorted_list)
	var _act_list = sc_map_to_list(action_list)
	var _level_list = ds_list_create(); ds_list_clear(_level_list)

	ini_open(path)
	for (var i=0; i<action_list_count; i++) {
		ds_map_read(current_action, ini_read_string("actions", _act_list[| i], ""))
		_level_list[| i] = current_action[? "level"]*1000 + i
	}
	ini_close()

	// sort by level
	ds_list_sort(_level_list, true)
	var n = 0
	for (var i=0; i<action_list_count; i++) {
		n = _level_list[| i] - (_level_list[| i] div 1000*1000)
		_sorted_list[| i] = _act_list[| n]
	}
	sc_create_slot_list(_sorted_list, action_slot, room_width - 64, 1920*3 + 32, 0)
	value = room_height
	slots_created = true
	
	ds_list_destroy(_act_list)
	ds_list_destroy(_sorted_list)
	ds_list_destroy(_level_list)
}

room_height = value
with ob_scroll_control {
	event_perform(ev_other, ev_room_end)
	view_index = 3
	view_x = 1920 * 3
	event_perform(ev_other, ev_room_start)
	
	instance_deactivate_layer("Elements")
	instance_deactivate_layer("Frames")
	instance_activate_region(view_x, view_y, view_w, room_height, true)
	// update UI elements
	with ob_frame 
		event_perform(ev_other,ev_user0)
}	




