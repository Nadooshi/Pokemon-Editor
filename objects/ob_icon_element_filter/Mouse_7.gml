/// @desc

var _act_list = sc_map_to_list(action_list)
var _elem_list = ds_list_create(); ds_list_clear(_elem_list)
var _sorted_list = ds_list_create(); ds_list_clear(_sorted_list)
var _filtered = ds_list_create(); ds_list_clear(_filtered)
var _level_list = ds_list_create(); ds_list_clear(_level_list)

for (var i=0; i<action_list_count; i++) {
	ds_map_read(current_action, bini_sections[? "actions"][? _act_list[| i]])
	_level_list[| i] = current_action[? "level"]*1000 + i
}

// sort by level
ds_list_sort(_level_list, true)
_sorted_list = ds_list_create(); ds_list_clear(_sorted_list)
var n = 0
for (var i=0; i<action_list_count; i++) {
	n = _level_list[| i] - (_level_list[| i] div 1000*1000)
	_sorted_list[| i] = _act_list[| n]
}

// filter
for (var i=0; i<action_list_count; i++) {
	ds_map_read(current_action, bini_sections[? "actions"][? _sorted_list[| i]])
	_elem_list [| i] = [current_action[? "element"], current_action[? "material"], i]
}

var _item = []
for (var i=0; i<ds_list_size(_elem_list)-1; i++) {
	_item = _elem_list[| i]
	if (_item[0] = value) or (_item[1] = value)
		ds_list_add(_filtered, _sorted_list[| _item[2]])
}

sc_clear_slot_list_in_view(action_slot, view_camera[ob_scroll_control.view_index])
sc_create_slot_list(_filtered, action_slot, room_width - 64, 1920*5 + 32, 240)

instance_deactivate_layer("Elements")
instance_deactivate_layer("Frames")
with ob_scroll_control
	instance_activate_region(view_x, view_y, view_w, room_height, true)

// update UI elements
with ob_frame 
	event_perform(ev_other,ev_user0)	

