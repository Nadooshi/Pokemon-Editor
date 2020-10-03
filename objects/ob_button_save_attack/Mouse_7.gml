/// @desc

// Inherit the parent event
event_inherited();

ds_map_add(action_list, current_action[? "name"], true)
action_list_count = ds_map_size(action_list)

ini_open(path)
	ini_write_string("actions", current_action[? "name"], ds_map_write(current_action))
	ini_write_string("actions", "action_list", ds_map_write(action_list))
ini_close()

// reload bini
bini_unload()
bini_load(path)

ds_map_copy(previous_map, current_action)

// add new action to edit_value
if last_room == rm_editor 
if not is_undefined(edit_value) and is_array(edit_value) {
	if dedicated_map[? "name"] != "" {
		var _bindedactions = ref_read(edit_value)
		ds_map_add(_bindedactions, dedicated_map[? "name"], true)
	}
}
