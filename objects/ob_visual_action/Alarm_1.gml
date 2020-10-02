/// @desc

col_el = ds_map_find_value(dedicated_map, "element")
col_mat = ds_map_find_value(dedicated_map, "material")

if not is_undefined(col_el) and not is_undefined(col_mat) {
	var bal=0.5,
		dmge=ds_map_find_value(dedicated_map, "dmg_element"),
		dmg=ds_map_find_value(dedicated_map, "damage");
	if dmg != 0 {
		bal = dmge / dmg
	} else {
		bal = 0.5
	}	
	image_blend=merge_color(material_colour[col_mat],elemental_colour[col_el], bal)
}
alarm_set(1,100)