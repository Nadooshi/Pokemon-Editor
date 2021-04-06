/// @desc

// Inherit the parent event
event_inherited();

/// sc_popup(where_from)

var sq = ceil(sqrt(_MATERIAL.count))
var rows = ceil(_MATERIAL.count/sq)
var popup_frame = sc_create_popup_frame(id, 525, 200, 96*sq+32, 96*rows+32)

var _count = 0
for (var i=0; i<sq; i++)
for (var k=0; k<sq; k++) {
	if _count = _MATERIAL.count
		break
	var obj = instance_create_layer(popup_frame.x + k*96+16, popup_frame.y + i*96+16, "Popups", ob_icon_variant_pokemon)
	obj.sprite_index = sp_material
	obj.image_speed = 0
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

