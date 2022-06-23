function sc_get_p_stage() {
	// Get max levels from predecessors
	var load_p = ds_map_create()
	var cur_poke = ds_map_find_first(pokemon_list)
	while not is_undefined(cur_poke) {
		var comp_poke = ds_map_find_first(pokemon_list)
		while not is_undefined(comp_poke) {
			if cur_poke = comp_poke {
				comp_poke = ds_map_find_next(pokemon_list, comp_poke)
				continue
			}
			try {
				var par_poke = evolution_tree[? cur_poke].parent
				if par_poke = comp_poke {
					sc_load_pokemon(comp_poke, load_p)
					p_stage[? cur_poke] = load_p[? "maxlevel"]
					break;
				}
			}
			catch(par_poke) {
				break;
			}
			comp_poke = ds_map_find_next(pokemon_list, comp_poke)
		}
		cur_poke = ds_map_find_next(pokemon_list, cur_poke)
	}
	ds_map_destroy(load_p)
}
//===============================================
/*
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
*/
