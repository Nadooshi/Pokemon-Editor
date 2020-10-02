/// @desc
event_inherited()
if valid or image_index = _ELEMENTAL.none
	exit

event_perform(ev_other, ev_user2)

var prev_valid = false
with ob_element_table {
	prev_valid = o_valid
	o_valid = true // show only invalid elements
	event_perform(ev_other, ev_user0)
	o_valid = prev_valid
}

