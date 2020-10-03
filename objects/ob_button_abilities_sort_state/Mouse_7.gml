/// @desc 

// Inherit the parent event
event_inherited();


if not slots_created {
	// read values
	var _abl_list = sc_map_to_list(ability_list)
	ds_list_sort(_abl_list, true)
	var _state_list = ds_list_create(); ds_list_clear(_state_list)

	for (var i=0; i<ability_count; i++) {
		ds_map_read(current_ability, bini_sections[? "abilities"][? _abl_list[| i]])
		_state_list[| i] = current_ability[? "state"]*1000 + i
	}

	// sort by A/P
	ds_list_sort(_state_list, true)
	var _sorted_list = ds_list_create(); ds_list_clear(_sorted_list)
	var n = 0
	for (var i=0; i<ability_count; i++) {
		n = _state_list[| i] - (_state_list[| i] div 1000*1000)
		_sorted_list[| i] = _abl_list[| n]
	}
	sc_create_slot_list(_sorted_list, ability_slot, room_width - 64, 1920*4 + 32, 0)
	ds_list_destroy(_sorted_list)
	ds_list_destroy(_abl_list)
	ds_list_destroy(_state_list)
	value = room_height
	slots_created = true
}

room_height = value
with ob_scroll_control {
	event_perform(ev_other, ev_room_end)
	view_index = 4
	view_x = 1920*4
	event_perform(ev_other, ev_room_start)
	
	instance_deactivate_layer("Elements")
	instance_deactivate_layer("Frames")
	instance_activate_region(view_x, view_y, view_w, room_height, true)
	// update UI elements
	with ob_frame 
		event_perform(ev_other,ev_user0)	

}	

