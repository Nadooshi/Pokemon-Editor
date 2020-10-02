/// @desc Clear attack and refresh

// Inherit the parent event
event_inherited();

/// Clear attack and refresh

ds_map_destroy(current_action)
current_action = sc_new_action()
ds_map_copy(previous_map, current_action)

with ob_button_delete_active
	event_perform(ev_mouse, ev_left_press)

sc_refresh_ui()
