/// @desc
if appeared
if not point_in_rectangle(mouse_x, mouse_y, bbox_left, bbox_top, bbox_right, bbox_bottom) {
	popup_appeared = false
	instance_destroy()
}
