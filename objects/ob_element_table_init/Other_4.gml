/// @desc 

var _slot = element_slot

var slot_w;
var slot_h;
var _slot_count = _ELEMENTAL.count - 1
var _x = 0
var _y = 32

with instance_create_layer(0, 0, "Frames", ds_map_find_value(_slot[0], "ob")) {
	image_xscale = ds_map_find_value(_slot[0], "xs")
	image_yscale = ds_map_find_value(_slot[0], "ys")
	slot_w = bbox_right - bbox_left - 8
	slot_h = bbox_bottom - bbox_top
	instance_destroy()
}

// create slots
var _width = room_width-64

var rowlength = floor(_width / slot_w)
var rowcount = floor(_slot_count / rowlength) + 1

var _count = 0
var _name =  elemental_text[_count]
var i = 0
var k = 0
for (i=0; i<rowcount; i++)
for (k=0; k<rowlength; k++) {
	if is_undefined(_name)
		break
	if _count = _slot_count
		break
	with sc_create_slot_composed(k*slot_w+_x, i*slot_h+_y, _name, _slot)
		index = _count
	_count++
	_name = elemental_text[_count]
}


// set image indexes
with ob_element_picture {
	hint = elemental_text[parent.index]
	image_index = parent.index
}

with ob_element_table {
	switch other.mode {
		case 0:
			table_use = element_table
			break;
		case 1:
			table_use = aura_table
			break;
	}
	event_perform(ev_other, ev_user0)
}
alarm[0] = 150