/// @desc

if popup_appeared exit

var rowlength = 6
var rowcount = floor(image_number / rowlength) + 1

var popup_frame = sc_create_popup_frame(id, x - 144, y - 16, rowlength * 128 + 32, rowcount * 128 + 32)

var _count = 0
for (var j=0; j<rowcount;  j++)
for (var i=0; i<rowlength; i++) {
	if _count >= image_number
		break
	var obj = instance_create_layer(popup_frame.x + i*128+16, popup_frame.y + 16 + j*128, "Popups", ob_upgrade_variant_ability)
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
