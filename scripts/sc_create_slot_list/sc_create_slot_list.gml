/// @arg slot_list
/// @arg slot
/// @arg width
/// @arg x
/// @arg y
function sc_create_slot_list(argument0, argument1, argument2, argument3, argument4) {

	var _slot_list = argument0
	var _slot_count = ds_list_size(_slot_list)
	var _slot = argument1
	var _width = argument2
	var _x = argument3
	var _y = argument4

	var slot_w;
	var slot_h;

	with instance_create_layer(0, 0, "Frames", ds_map_find_value(_slot[0], "ob")) {
		image_xscale = ds_map_find_value(_slot[0], "xs")
		image_yscale = ds_map_find_value(_slot[0], "ys")
		slot_w = bbox_right - bbox_left
		slot_h = bbox_bottom - bbox_top
		instance_destroy()
	}

	// create slots

	var rowlength = floor(_width / slot_w)
	var rowcount = floor(_slot_count / rowlength) + 1

	var _count = 0
	var _name = _slot_list[| _count]
	var i = 0
	var k = 0
	for (i=0; i<rowcount; i++)
	for (k=0; k<rowlength; k++) {
		if is_undefined(_name)
			break
		if _count = _slot_count
			break
		sc_create_slot_composed(k*slot_w+_x, i*slot_h+_y, _name, _slot)
		_count++
		_name = _slot_list[| _count]
	}

	room_height = max(room_height, max(1080, slot_h * rowcount + _y))



}
