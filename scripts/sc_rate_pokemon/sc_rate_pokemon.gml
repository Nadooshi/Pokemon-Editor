function sc_rate_pokemon(_pokemon_map) {
	//@ desc Calculate rating for pokemon
	///@arg pokemon_map

	var _cur_rate = 0
	var _ap = _pokemon_map[? "ap"]
	var _val = []


	switch _pokemon_map[? "size"] {
		case _SIZE.tiny :{
			_cur_rate = 10 * (_ap - 5)
			break;
		}
		case _SIZE.normal :{
			_cur_rate = 5 * (_ap - 5)
			break;
		}
		case _SIZE.big :{
			_cur_rate = 10 * (_ap - 5)
			break;
		}
		case _SIZE.giant :{
			_cur_rate = 15 * (_ap - 5)
			break;
		}
	}

	_cur_rate += (9 + _ap) * _ap
	_val[0] = 0

	//==============================================================
	if _pokemon_map[? "flyable"] > 0
		_cur_rate += 25
	if _pokemon_map[? "digable"] > 0
		_cur_rate += 35
	if not is_undefined(_pokemon_map[? "passive_1"])
	if _pokemon_map[? "passive_1"] != ""
		_cur_rate += 15
	if not is_undefined(_pokemon_map[? "passive_2"])
	if _pokemon_map[? "passive_2"] != "" 
		_cur_rate += 15
	//==============================================================
	var _a_rate = 0
	var _dmg = 0
	var _name = ds_map_find_first(_pokemon_map[? "actions"])
	var _temp_map = ds_map_create()
	var _count = 0
	
	while not is_undefined(_name) {
		_count++
		ds_map_read(_temp_map, bini_sections[? "actions"][? _name])
			if not is_undefined(_temp_map[? "rating"])
				_a_rate += _temp_map[? "rating"]
			if not is_undefined(_temp_map[? "damage"])
				_dmg += _temp_map[? "damage"]
		_name = ds_map_find_next(_pokemon_map[? "actions"], _name)
	}
		
	ds_map_destroy(_temp_map)

	_val[0] = _dmg / _count
	_val[1] = _a_rate / _count
	_cur_rate += (_val[0] + _val[1]) * 0.3

	_val[0] = 0; _val[1] = 0
	//==============================================================
	_name = _pokemon_map[? "title"]
	var pr_lvl = 1
	var _f = _pokemon_map[? "force"]
	if not is_undefined(_name) 
	if not is_undefined(p_stage[? _name]) 
		pr_lvl = (p_stage[? _name]) + 1

	_val[0] = _pokemon_map[? "health"]
	_val[1] = sc_calculate_formula(1, _f, pr_lvl, 0)
	_val[2] = _val[0] / _val[1] // percentage ratio of health

	_cur_rate += (_val[0] *0.1) * max(1, _ap - 4)

	_cur_rate = _cur_rate * _val[2]
	_val[0] = 0; _val[1] = 0; _val[2] = 0

	//==============================================================

	return _cur_rate
}
