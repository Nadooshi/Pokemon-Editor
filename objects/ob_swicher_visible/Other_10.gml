/// @desc


var _type = ds_map_find_value(current_item, "item type")

with ob_switch_button_item
if index > 0 {
	event_perform( ev_other, ev_user0)
	visible = false
}

switch _type {
	case _ITEM_TYPE.berry :
		with ob_switch_button_item
			if index = 1 {
				visible = true
			}
		with ob_icon_element_item
			visible = false
	break;
	case _ITEM_TYPE.potion :
		with ob_switch_button_item
			if index = 2 {
				visible = true
			}
		with ob_icon_element_item
			visible = false
	break;
	case _ITEM_TYPE.stone :
		with ob_switch_button_item
			if index > 0
				visible = false
		with ob_icon_element_item
			visible = true
	break;
	case _ITEM_TYPE.artifact :
		with ob_switch_button_item
			if index = 3 {
				visible = true
			}
		with ob_icon_element_item
			visible = true
	break;
}


