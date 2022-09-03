/// @desc
toRefresh = true

ds_map_read(current_item, bini_sections[? "inventory"][? name])
if not is_undefined(current_item)
	event_perform_object(ob_frame, ev_other, ev_user0)
else
	show_message("Item \"" + name + " failed to load")


toRefresh = false

