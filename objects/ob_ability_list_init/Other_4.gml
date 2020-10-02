/// @desc

edit_value = ds_stack_pop(ref_stack)

with ob_button_abilities_sort_name
	event_perform(ev_mouse, ev_left_release)

// update UI elements
dedicated_map = ds_map_create()
ini_open(path)
	with ob_ui_object
	if instance_exists(parent) {
		ds_map_read(dedicated_map, ini_read_string("abilities", parent.name, ""))
		event_perform(ev_other, ev_user0)
	}
ini_close()
ds_map_destroy(dedicated_map)

// edit mode processing
tx_mode_ability_list.caption = (edit_mode ? "Editing" : "Select") + " ability"

if not edit_mode {   // select_mode
	instance_destroy(ob_button_ability_add)	
	instance_destroy(ob_button_ability_delete)
	instance_destroy(ob_button_ability_edit)
}

