/// @desc

if instance_exists(parent)
if not parent.toRefresh
	exit

value = ds_map_find_value(current_item, parameter_name)
if is_undefined(value) value=0

image_index = value
hint = elemental_text[value]
