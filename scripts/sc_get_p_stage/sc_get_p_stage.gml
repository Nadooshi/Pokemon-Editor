function sc_get_p_stage() {
	// Get max levels from predecessors

	var _temp  = ds_map_create()
	var _name  = ds_map_find_first(pokemon_list)
	while not is_undefined(_name) {
		var _name2 = ds_map_find_first(pokemon_list)
		while not is_undefined(_name2) {
			if _name =_name2 {
				_name2 = ds_map_find_next(pokemon_list, _name2)
				continue
			}
			sc_load_pokemon(_name2, _temp)
			if _name = _temp[? "evolution"] {
				p_stage[? _name] = _temp[? "maxlevel"]
				break
			}
			_name2 = ds_map_find_next(pokemon_list, _name2)
		}
		_name = ds_map_find_next(pokemon_list, _name)

	}
	ds_map_destroy(_temp)



}
