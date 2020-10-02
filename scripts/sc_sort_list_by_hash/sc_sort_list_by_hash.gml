/// @arg list
function sc_sort_list_by_hash(argument0) {
	var _list = argument0

	// sort by hash
	var _hash = ""
	var _pos = 0
	var _s = ""
	var _size = ds_list_size(_list)
	var _hash_list = ds_list_create()
	var _prev_list = ds_list_create()

	// get hashes
	for (var i=0; i<_size; i++) {
		_pos = string_pos("#", _list[| i])
		if _pos = 0
			_hash = ""
		else
			_hash = string_lower(string_copy(_list[| i], _pos+1, 10))
		_s = string(i)
		_hash_list[| i] = _hash + "#" + string_repeat("0", 3-string_length(_s)) + _s
	}

	ds_list_sort(_hash_list, true)
	ds_list_copy(_prev_list, _list)
	var _index = 0
	for (var i=0; i<_size; i++) {
		_pos = string_pos("#", _hash_list[| i])
		_index = real(string_copy(_hash_list[| i], _pos+1, 10))
		_list[| i] = _prev_list[| _index]
	}

	ds_list_destroy(_prev_list)
	ds_list_destroy(_hash_list)



}
