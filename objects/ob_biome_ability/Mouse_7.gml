/// @desc

if popup_appeared exit

var _cols = ceil(sqrt(image_number))
var rows = ceil(image_number/_cols)
var popup_frame = sc_create_popup_frame(id, x + 144, y - 16, _cols * 128 + 32, rows*128+32)

var _count = 0
for (var i=0; i<_cols; i++) 
for (var k=0; k<_cols; k++) {
	if _count > (image_number-1)
		break
	var obj = instance_create_layer(popup_frame.x + k*128+16, popup_frame.y + i*128+16, "Popups", ob_biome_variant_ability)
	obj.image_index = _count
	obj.value = _count
	obj.depth = -1
	obj.parent = popup_frame
	//obj.hint = ??
	popup_frame.ui_objects[popup_frame.ui_objects_count] = obj
	popup_frame.ui_objects_count++
	_count++
}

popup_appeared = true
