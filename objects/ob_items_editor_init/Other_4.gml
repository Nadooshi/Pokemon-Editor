/// @desc

var _pic_count = sprite_get_number(sp_items)
var _maxcount = ceil((view_wport[2] - 96 - 192) / 96)
var _rowscount = floor(_pic_count / _maxcount) + 1
var _sz = 110

var _count = 0
var i = 0
var k = 0
for (i=0; i<_rowscount; i++)
for (k=0; k<_maxcount;  k++) {
	if _count >= _pic_count
		break
	with instance_create_layer(k*_sz+32+48-1360, i*_sz+32+48, "Elements", ob_item_picture_variant) {
		index = _count
		image_index = index
		parameter_name = "picture"
	}
	
	_count++
}

height_pictures = max(1080, _sz * _rowscount + 96 + 112)


#region // create item slot
var _elem = ds_map_create()
var slot_elements_count = 1

_elem[? "x"] = 0
_elem[? "y"] = 0
_elem[? "xs"] = ob_frame_item.image_xscale
_elem[? "ys"] = ob_frame_item.image_yscale
_elem[? "ob"] = ob_frame_item
_elem[? "param"] = ""

item_slot[0] = ds_map_create()
ds_map_copy(item_slot[0], _elem)

with ob_ui_object
if place_meeting(x, y, ob_frame_item) {
	_elem[? "x"] = x - ob_frame_item.x
	_elem[? "y"] = y - ob_frame_item.y
	_elem[? "xs"] = image_xscale
	_elem[? "ys"] = image_yscale
	_elem[? "ob"] = object_index
	_elem[? "param"] = parameter_name
	
	other.item_slot[slot_elements_count] = ds_map_create()
	ds_map_copy(other.item_slot[slot_elements_count], _elem)
	slot_elements_count++
}

#endregion

// clear item_slot[] from memory!

var _list = sc_map_to_list(item_list)
sc_create_slot_list( _list, item_slot, 1360, 16, 16)
ds_list_destroy(_list)

height_items = room_height

sc_group_ui_objects(frameParam)

//room_height = height_pictures

//sc_refresh_ui()
