/// @desc

if popup_appeared
	exit

// Inherit the parent event
event_inherited();

/// sc_popup(where_from)
var _x = 864+96, _y = 448+96
var sq = ceil(sqrt(_MATERIAL.count))
var rows = ceil(_MATERIAL.count/sq)
var popup_frame = sc_create_popup_frame(id, _x, _y, 96*sq+32, 96*rows+32)

var _count = 0
for (var i=0; i<sq; i++)
for (var k=0; k<sq; k++) {
	if _count = _MATERIAL.count
		break
	var obj = instance_create_layer(popup_frame.x + k*96+16, popup_frame.y + i*96+16, "Popups", ob_material_variant_attack)
	obj.image_index = _count
	obj.value = _count
	obj.depth = -1
	obj.parent = popup_frame
	obj.hint = material_text[_count]
	popup_frame.ui_objects[popup_frame.ui_objects_count] = obj
	popup_frame.ui_objects_count++
	_count++
}

popup_appeared = true

