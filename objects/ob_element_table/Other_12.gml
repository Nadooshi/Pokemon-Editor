/// @desc Make splash

with instance_create_layer(
	(bbox_left + bbox_right) * 0.5,
	(bbox_top + bbox_bottom) * 0.5, "Popups", ob_splash
	) {
	parent = other.id
}

