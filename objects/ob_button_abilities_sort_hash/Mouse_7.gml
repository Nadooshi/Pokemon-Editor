/// @desc

// Inherit the parent event
event_inherited();

if not slots_created {
	var _sorted_list = sc_map_to_list(ability_list)
	// sort by hash
	sc_sort_list_by_hash(_sorted_list)
	sc_create_slot_list(_sorted_list, ability_slot, room_width - 64, 1920 + 1920 + 32, 0)
	ds_list_destroy(_sorted_list)
	value = room_height
	slots_created = true
}

room_height = value
with ob_scroll_control {
	event_perform(ev_other, ev_room_end)
	view_index = 2
	view_x = 1920 + 1920
	event_perform(ev_other, ev_room_start)
	
	instance_deactivate_layer("Elements")
	instance_deactivate_layer("Frames")
	instance_activate_region(view_x, view_y, view_w, room_height, true)
	// update UI elements
	with ob_frame 
		event_perform(ev_other,ev_user0)	
}	
	


