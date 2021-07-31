/// @desc
if is_undefined(value) or value = ""
	exit;
	
if value > 500 {
	image_blend = c_purple
}
if value < 0 {
	image_blend = c_red
}
event_inherited();
	image_blend = c_white
