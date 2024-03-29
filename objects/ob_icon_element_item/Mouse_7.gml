/// @desc

if not visible exit
if not clickable exit

// Inherit the parent event
event_inherited();

var sq = ceil(sqrt(_ELEMENTAL.count))
var rows = ceil(_ELEMENTAL.count/sq)
var popup_frame = sc_create_popup_frame(id, 525, 200, 96*sq+32, 96*rows+32)
var _count = 0
for (var i=0; i<sq; i++)
for (var k=0; k<sq; k++) {
	if _count = _ELEMENTAL.count
		break
	var obj = instance_create_layer(popup_frame.x + k*96+16, popup_frame.y + i*96+16, "Popups", ob_icon_variant_item)
	obj.sprite_index = sp_elemental
	obj.image_speed = 0
	obj.image_index = _count
	obj.value = _count
	obj.depth = -1
	obj.parent = popup_frame
	obj.hint = elemental_text[_count]
	popup_frame.ui_objects[popup_frame.ui_objects_count] = obj
	popup_frame.ui_objects_count++
	_count++
}

popup_appeared = true
