/// @arg map
function sc_map_to_list(argument0) {
	var _map = argument0
	var _list = ds_list_create()
	ds_list_clear(_list)

	var _s = ds_map_find_first(_map)
	while not is_undefined(_s) {
		ds_list_add(_list, _s)
		_s = ds_map_find_next(_map, _s)
	}

	return _list





}
