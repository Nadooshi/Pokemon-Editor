/// @desc

// Inherit the parent event
if popup_appeared exit

event_inherited();

if variant_count > 0 {
	variant_index = (variant_index + 1) mod variant_count

	value = variant_value[variant_index]
	caption = variant_text[variant_index]

	ds_map_set(current_item, parameter_name, value)
	with dependent_object
		event_perform(ev_other, ev_user0)
}

event_perform( ev_other, ev_user0)

