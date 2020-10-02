/// @arg slot
/// @arg camera
function sc_clear_slot_list_in_view(argument0, argument1) {
	var _slot = argument0
	var _cam = argument1

	with ds_map_find_value(_slot[0], "ob") {
		if x > camera_get_view_x(_cam) and
		   x < camera_get_view_x(_cam) + camera_get_view_width(_cam)
		instance_destroy()
	}



}
