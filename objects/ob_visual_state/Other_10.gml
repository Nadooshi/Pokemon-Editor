/// @desc 
var temp_map
var n

n = ds_map_find_value(dedicated_map, parameter_name) // parameter_name => active

if not is_undefined(n) and (n != "") {
	temp_map = ds_map_create()
	
	ds_map_read(temp_map, bini_sections[? "abilities"][? n])
	
	value = ds_map_find_value(temp_map,"state")
	image_index = value
	
	ds_map_destroy(temp_map)
} else {
	image_index = 0
	value = 0
}