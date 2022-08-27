///@arg parent_frame
function sc_group_ui_objects(parent_frame, with_frames = false) {

	if not instance_exists(parent_frame)
		exit
	
	with ob_ui_object 
	if place_meeting(x, y, parent_frame) {
		parent = parent_frame
		parent.ui_objects[parent.ui_objects_count] = id
		parent.ui_objects_count++
	}

	if with_frames
	with ob_frame
	if place_meeting(x, y, parent_frame) {
		parent = parent_frame
		parent.ui_objects[parent.ui_objects_count] = id
		parent.ui_objects_count++
	}



}
