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
	with instance_create_layer(k*_sz+32+48-1000, i*_sz+32+48, "Elements", ob_item_picture_variant) {
		index = _count
		image_index = index
		parameter_name = "picture"
	}
	
	_count++
}

height_pictures = max(1080, _sz * _rowscount + 96 + 112)
room_height = height_pictures

