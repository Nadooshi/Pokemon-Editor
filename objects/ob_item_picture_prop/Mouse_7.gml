/// @desc

if not clickable exit

view_visible[0] = false
view_visible[2] = true

with ob_scroll_control {
	event_perform(ev_other, ev_room_end)
	view_index = 2
	view_x = -1360
	event_perform(ev_other, ev_room_start)
}
editing = true

room_height = ob_items_editor_init.height_pictures
