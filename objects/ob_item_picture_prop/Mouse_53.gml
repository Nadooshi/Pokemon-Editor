/// @desc

if not clickable exit

if editing 
if mouse_x > view_xport[1] {
	view_visible[2] = false
	view_visible[0] = true
	with ob_scroll_control {
		event_perform(ev_other, ev_room_end)
		view_index = 0
		view_x = 0
		event_perform(ev_other, ev_room_start)
	}
	editing = false
}
