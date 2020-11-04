/// @desc optimization

with ob_scroll_control {
	var _cam = view_camera[view_index]
	instance_deactivate_layer(layer_get_id("Elements"))
	instance_deactivate_layer(layer_get_id("Frames"))
	instance_activate_region(
		camera_get_view_x(_cam), camera_get_view_y(_cam) - abs(dScroll),
		camera_get_view_width(_cam), camera_get_view_height(_cam) + abs(dScroll*2),
		true
	)
}
