/// @arg parent_id
/// @arg x
/// @arg y
/// @arg w
/// @arg h
function sc_create_popup_frame(argument0, argument1, argument2, argument3, argument4) {

	var _id = argument0
	var _x = argument1
	var _y = argument2
	var _w = argument3
	var _h = argument4

	if _y+_h > room_height _y = room_height-_h

	var popup_frame = instance_create_layer(_x, _y, "Popups", ob_popup_frame)
	popup_frame.parent = _id
	popup_frame.image_xscale = _w / sprite_get_width(popup_frame.sprite_index)
	popup_frame.image_yscale = _h / sprite_get_height(popup_frame.sprite_index)


	return popup_frame



}
