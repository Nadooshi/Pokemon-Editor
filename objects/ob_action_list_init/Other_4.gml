/// @desc


// create filter pictures
var _elem_count = _ELEMENTAL.count-1
var vcount = 2
var hcount = ceil(_elem_count/vcount)
var _w = 96*hcount
var _x = 1920*5 + (room_width-_w)*0.5
var _count = 0
for (var i=0; i<vcount; i++)
for (var k=0; k<hcount; k++) {
	if _count = _elem_count
		break
	var obj = instance_create_layer(_x + k*96+16, 32 + i*96+16, "Popups", ob_icon_element_filter)
	obj.image_index = _count
	obj.value = _count
	obj.depth = -1
	obj.hint = elemental_text[_count]
	_count++
}
ob_button_sort_element.value = 980

// sort by name
with ob_button_sort_name
	event_perform(ev_mouse, ev_left_release)

// edit mode processing
tx_mode_action_list.caption = (edit_mode ? "Editing" : "Select") + " action"

if not edit_mode {   // select_mode
	instance_destroy(ob_button_action_add)	
	instance_destroy(ob_button_action_delete)
	instance_destroy(ob_button_edit)
}

