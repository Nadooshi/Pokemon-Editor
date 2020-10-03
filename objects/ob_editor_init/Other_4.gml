/// @desc

var _original_map = ds_stack_pop(map_stack)
current_pokemon = _original_map
dedicated_map = ds_map_create()
ds_map_copy(dedicated_map, _original_map)
previous_map = ds_stack_pop(previous_map_stack)

sc_refresh_ui()

// create action slots
var slot_w;
var slot_h;

with instance_create_layer(0, 0, "Frames", ds_map_find_value(action_slot[0], "ob")) {
	image_xscale = ds_map_find_value(action_slot[0], "xs")
	image_yscale = ds_map_find_value(action_slot[0], "ys")
	slot_w = bbox_right - bbox_left
	slot_h = bbox_bottom - bbox_top
	instance_destroy()
}

// ---------
if is_undefined(dedicated_map[? "actions"]) 
	exit
var _act_list = ds_list_create(); ds_list_clear(_act_list)
var _level_list = ds_list_create(); ds_list_clear(_level_list)
var _temp_map = ds_map_create(); ds_map_clear(_temp_map)

var _actioncount = ds_map_size(dedicated_map[? "actions"])
var _w = camera_get_view_width(view_camera[1])
var _xoffset = camera_get_view_x(view_camera[1])
var rowlength = floor(( _w - 64) / slot_w)
var rowcount = floor(_actioncount / rowlength) + 1

// sort action by level and create slots
var _count = 0
var _name = ds_map_find_first(dedicated_map[? "actions"])

while not is_undefined(_name) {
	ds_list_add(_act_list, _name) 
	_name = ds_map_find_next(dedicated_map[? "actions"], _name)
	_count++ 
}

for (var i=0; i<_actioncount; i++) {
	ds_map_read(_temp_map, bini_sections[? "actions"][? _act_list[| i]])
	_level_list[| i] = _temp_map[? "level"]*1000 + i
}
	
ds_list_sort(_level_list, true)
var _sorted_list = ds_list_create(); ds_list_clear(_sorted_list)
var n = 0
for (var i=0; i<_actioncount; i++) {
	n = _level_list[| i] - (_level_list[| i] div 1000*1000)
	_sorted_list[| i] = _act_list[| n]
}

var _count = 1 //0
_name = ds_list_find_value(_sorted_list, 0) // ds_map_find_first(dedicated_map[? "actions"])
var i = 0
var k = 0
for (i=0; i<rowcount; i++)
for (k=0; k<rowlength; k++) {
	if is_undefined(_name)
		break
	if _count > _actioncount
		break
	sc_create_slot_composed(k*slot_w+32 + _xoffset, i*slot_h+32, _name, action_slot)
	_name = ds_list_find_value(_sorted_list, _count) // ds_map_find_next(dedicated_map[? "actions"], _name)
	_count++
}
ds_list_destroy(_sorted_list)
ds_list_destroy(_act_list)
ds_list_destroy(_level_list)
ds_map_destroy(_temp_map)
//------------------------

room_height = max(1080, slot_h * rowcount)


// refresh ability slots
with ob_frame_ability {
	event_perform(ev_other, ev_user0)
	dedicated_map = _original_map
}

instance_destroy(ob_button_ability_edit)
instance_destroy(ob_button_ability_delete)

// refresh action slots
with ob_frame_action
	event_perform(ev_other, ev_user0)

dedicated_map = _original_map

instance_destroy(ob_button_edit)

with ob_button_action_delete {
	with instance_create_layer(x, y, "Elements", ob_button_unbind_action)
		parent = other.parent
	instance_destroy()
}

dedicated_map = _original_map
