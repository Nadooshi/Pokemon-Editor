/// @desc 

// Inherit the parent event
event_inherited();

var _index = real(parent.parent.parameter_name)
var _elem = table_use[@ base_elem_index]
_elem[@ _index] = value


with ob_frame_element_table 	
	event_perform(ev_other, ev_user0)

// clean conflicts
with ob_element_table_init
	event_perform(ev_other, ev_user0)
	
with ob_popup_frame
	instance_destroy()
