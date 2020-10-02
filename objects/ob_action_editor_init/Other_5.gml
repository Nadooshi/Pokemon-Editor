/// @desc 

// add new action to edit_value
if last_room == rm_editor
if not is_undefined(edit_value) and is_array(edit_value) {
	if dedicated_map[? "name"] != "" {
		var _bindedactions = ref_read(edit_value)
		ds_map_add(_bindedactions, dedicated_map[? "name"], true)
	}	
}
current_rating = 0