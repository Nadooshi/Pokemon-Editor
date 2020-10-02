/// @desc
var temp_map
var n

n = ds_map_find_value(dedicated_map, parameter_name) // p...r_name = active

if not is_undefined(n) and (n != "") {
	temp_map = ds_map_create()
	ini_open(path)
		ds_map_read(temp_map, ini_read_string("abilities", n, ""))
	
		value = ds_map_find_value(temp_map,"multiply")
	
	ini_close()
	ds_map_destroy(temp_map)
} else {
	value = 0
}

caption = "x" + string(value+1)