/// @desc

var _original_map = ds_stack_pop(map_stack)
previous_map = ds_stack_pop(previous_map_stack)
current_action = _original_map
dedicated_map = _original_map
edit_value = ds_stack_pop(ref_stack)
current_rating = 0 // refresh rating for calculate new

sc_refresh_ui()

with ob_frame_ability {
	event_perform(ev_other, ev_user0)
	dedicated_map = _original_map
}

instance_destroy(ob_button_ability_edit)
instance_destroy(ob_button_ability_delete)

