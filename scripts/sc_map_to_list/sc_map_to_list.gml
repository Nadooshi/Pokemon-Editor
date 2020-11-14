/// @arg map
function sc_map_to_list(_map) {
	var _list = ds_list_create()
	ds_list_clear(_list)
	var _arr = []
	ds_map_keys_to_array(_map, _arr)
	
	for (var i=0; i<array_length(_arr); i++)
		ds_list_add(_list, _arr[i])
		
	//var _s = ds_map_find_first(_map)
	//while not is_undefined(_s) {
	//	ds_list_add(_list, _s)
	//	_s = ds_map_find_next(_map, _s)
	//}

	return _list
}
