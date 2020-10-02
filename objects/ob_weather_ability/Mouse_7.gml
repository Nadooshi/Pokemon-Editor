/// @desc

if popup_appeared exit

var _cols = image_number
var popup_frame = sc_create_popup_frame(id, x + 144, y - 16, _cols * 128 + 32, 160)

for (var i=0; i<_cols; i++) {
	var obj = instance_create_layer(popup_frame.x + i*128+16, popup_frame.y + 16, "Popups", ob_weather_variant_ability)
	obj.image_index = i
	obj.value = i
	obj.depth = -1
	obj.parent = popup_frame
	//obj.hint = ??
	popup_frame.ui_objects[popup_frame.ui_objects_count] = obj
	popup_frame.ui_objects_count++
}

popup_appeared = true
