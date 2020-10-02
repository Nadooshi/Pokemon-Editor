/// @desc

// Inherit the parent event
event_inherited();

room_height = value
with ob_scroll_control {
	event_perform(ev_other, ev_room_end)
	view_index = 5
	view_x = 1920 * 5
	camY = 0
	dScroll = 0
	event_perform(ev_other, ev_room_start)
}	

