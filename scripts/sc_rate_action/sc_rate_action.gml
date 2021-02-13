///@desc Calculate raiting for action
///@arg action_map
function sc_rate_action(_a_map, _abil_map) {

	var _cur_rate = 0
	var _val = 0
	var _type = ds_map_find_value(_a_map,"type")
	var _abil_loaded = false
	
	if not is_undefined(_abil_map)
	if ds_exists(_abil_map, ds_type_map)
	if not ds_map_empty(_abil_map)
		_abil_loaded = true
		
	if not _abil_loaded {
		var _s = bini_sections[? "abilities"][? _a_map[? "active"]]
		if not is_undefined(_s) {
			_abil_map = ds_map_create()
			ds_map_read(_abil_map, _s)
		} else
			_abil_map = undefined
	}
	var _a_name = _a_map[? "name"]
	//=======================================================================================
	switch _type {
		case _ATTACK_TYPE.front: {
			_val[0] = ds_map_find_value(_a_map,"ap")
			_cur_rate += 15 * max((10 - _val[0] * 0.1),1)
			sc_logging("Calc_rating", _a_name , "attack type front", _cur_rate)
			break; 
		}
		case _ATTACK_TYPE.melee: {
			_val[0] = ds_map_find_value(_a_map, "radius")
			_val[1] = ds_map_find_value(_a_map,"ap")
			_cur_rate = (_cur_rate + 20 + _val[0] * 5) * max((10 - _val[1] * 0.1),1)
			sc_logging("Calc_rating", _a_name , "attack type melee", _cur_rate)
			break; 
		}
		case _ATTACK_TYPE.lunge: {
			_val[0] = ds_map_find_value(_a_map,"range")
			_val[1] = _val[0] * 0.09 + 1
			_cur_rate = _cur_rate + 55 + power(_val[0], _val[1])
			sc_logging("Calc_rating", _a_name , "attack type lunge", _cur_rate)
			break; 
		}
		case _ATTACK_TYPE.swoop: {
			_val[0] = ds_map_find_value(_a_map,"range")
			_val[1] = _val[0] * 0.09 + 1
			_cur_rate = _cur_rate + 45 + power(_val[0], _val[1])
			sc_logging("Calc_rating", _a_name , "attack type swoop", _cur_rate)
			break; 
		}
		case _ATTACK_TYPE.range: {
			_val[0] = ds_map_find_value(_a_map, "radius")
			_val[1] = ds_map_find_value(_a_map,"range")
			_val[2] = _val[1] * 0.07 + 1
			_cur_rate = _cur_rate + 35 + _val[0] * 5 + power(_val[1], _val[2])
			sc_logging("Calc_rating", _a_name , "attack type range", _cur_rate)
			break; 
		}
		case _ATTACK_TYPE.wave: {
			_val[0] = ds_map_find_value(_a_map, "radius")
			_val[1] = ds_map_find_value(_a_map,"range")
			_val[2] = _val[1] * 0.10 + 1
			_cur_rate = _cur_rate + 65 + _val[0] * 25 + power(_val[1], _val[2])
			sc_logging("Calc_rating", _a_name , "attack type wave", _cur_rate)
			break; 
		}
		case _ATTACK_TYPE.ray: {
			_val[0] = ds_map_find_value(_a_map, "radius")
			_val[1] = ds_map_find_value(_a_map,"range")
			_val[2] = _val[1] * 0.08 + 1
			_cur_rate = _cur_rate + 50 + _val[0] * 10 + power(_val[1], _val[2])
			sc_logging("Calc_rating", _a_name , "attack type ray", _cur_rate)
			break; 
		}
		case _ATTACK_TYPE.mortar: {
			_val[0] = ds_map_find_value(_a_map, "radius")
			_val[1] = ds_map_find_value(_a_map,"range")
			_val[2] = _val[1] * 0.09 + 1
			_cur_rate = _cur_rate + 25 + _val[0] * 20 + power(_val[1], _val[2])
			sc_logging("Calc_rating", _a_name , "attack type mortar", _cur_rate)
			break; 
		}
		case _ATTACK_TYPE.pool: {
			_val[0] = ds_map_find_value(_a_map, "radius")
			_val[1] = ds_map_find_value(_a_map,"range")
			_val[2] = _val[1] * 0.03 + 1
			_cur_rate = _cur_rate + 15 + _val[0] * 15 + power(_val[1], _val[2])
			sc_logging("Calc_rating", _a_name , "attack type pool", _cur_rate)
			break; 
		}
		case _ATTACK_TYPE.cloud: {
			_val[0] = ds_map_find_value(_a_map, "radius")
			_val[1] = ds_map_find_value(_a_map,"range")
			_val[2] = _val[1] * 0.04 + 1
			_cur_rate = _cur_rate + 20 + _val[0] * 20 + power(_val[1], _val[2])
			sc_logging("Calc_rating", _a_name , "attack type cloud", _cur_rate)
			break; 
		}
		case _ATTACK_TYPE.aura: {
			_val[1] = ds_map_find_value(_a_map,"range")
			_val[2] = _val[1] * 0.11 + 1
			_cur_rate += 65 + power(_val[1], _val[2])
			sc_logging("Calc_rating", _a_name , "attack type aura", _cur_rate)
			break; 
		}
		case _ATTACK_TYPE.barrier: {
			_val[0] = ds_map_find_value(_a_map, "radius")
			_val[1] = ds_map_find_value(_a_map,"range")
			_val[2] = _val[1] * 0.06 + 1
			_val[3] = ceil(ds_map_find_value(_a_map, "damage") * 0.1)
			_cur_rate = _cur_rate + (5 + power(_val[1], _val[2]) + _val[3]) * (_val[0] + 1)
			sc_logging("Calc_rating", _a_name , "attack type barrier", _cur_rate)
			break; 
		}
	}
	_val[0] = 0; _val[1] = 0; _val[2] = 0; _val[3] = 0;

	//=======================================================================================
	switch ds_map_find_value(_a_map,"bullet_phys") {
		case _BULLET_PH.custom:{
			_cur_rate += 15
			sc_logging("Calc_rating", _a_name , "bullet phys custom +", 15)
			break;
		}
		case _BULLET_PH.soft:{
			_cur_rate += 0
			sc_logging("Calc_rating", _a_name , "bullet phys soft", 0)
			break;
		}
		case _BULLET_PH.chain:{
			_cur_rate += 55
			sc_logging("Calc_rating", _a_name , "bullet phys chain +", 55)
			break;
		}
		case _BULLET_PH.piercer:{
			_cur_rate += 25
			sc_logging("Calc_rating", _a_name , "bullet phys piercer +", 25)
			break;
		}
		case _BULLET_PH.bowl:{
			_cur_rate += 35
			sc_logging("Calc_rating", _a_name , "bullet phys bowl +", 35)
			break;
		}
	}
	
	//=======================================================================================
	var tgRates = [4, 4];
	tgRates[_ATTACK_TG.air,		 _ATTACK_TG.air	]		= 5
	tgRates[_ATTACK_TG.air,		 _ATTACK_TG.ground]		= 10
	tgRates[_ATTACK_TG.air,		 _ATTACK_TG.underground]= 30
	tgRates[_ATTACK_TG.ground,	 _ATTACK_TG.air	]		= 20
	tgRates[_ATTACK_TG.ground,	 _ATTACK_TG.ground]		= 0
	tgRates[_ATTACK_TG.ground,	 _ATTACK_TG.underground]= 10
	tgRates[_ATTACK_TG.underground, _ATTACK_TG.air	]	= 15
	tgRates[_ATTACK_TG.underground, _ATTACK_TG.ground]	= 5
	tgRates[_ATTACK_TG.underground, _ATTACK_TG.underground]	= 10

	var _iFrom = 1
	var _iTo = 1
	for(var i=1; i<=3; i++) {
		if _a_map[? "tgFrom"] & _iFrom {
			_iTo = 1
			for(var j=1; j<=3; j++) {
				if _a_map[? "tgTo"] & _iTo
					_val[0] += tgRates[_iFrom, _iTo]
				_iTo = _iTo << 1
			}
		}
		_iFrom = _iFrom << 1
	}
	_cur_rate += _val[0] 
	sc_logging("Calc_rating", _a_name , "attack targets +", _val[0])
	
	_val[0] = 0

	//=======================================================================================

	_val[0] = ds_map_find_value(_a_map,"level")
	_val[1] = ds_map_find_value(_a_map,"ap")
	_val[2] = sc_calculate_formula(4,0,_val[0],_val[1]) // calculate 'ideal' damage
	_val[3] = ds_map_find_value(_a_map, "damage")
	_cur_rate += (50 - _val[1]) //for ap
	_val[4] = _val[3] / _val[2] // percentage ratio of damage
	sc_logging("Calc_rating", _a_name , "ap value +", (50 - _val[1]))

	if _val[3] != 0 
		if _type = _ATTACK_TYPE.barrier {
			_cur_rate += _val[3]*_val[4]
			sc_logging("Calc_rating", _a_name , "damage value +", (_val[3]*_val[4]))
		} else {
			_cur_rate = _cur_rate*_val[4]
			sc_logging("Calc_rating", _a_name , "damage value *", (_val[4]))
		}
	else 
		if is_undefined(_abil_map) {
			_cur_rate = 0
			sc_logging("Calc_rating", _a_name , "damage value = 0 rate = ", _cur_rate)
		}


	for (var i = 0; i < 5; i++)
		_val[i] = 0

	//=======================================================================================

	_val[2] = 1
	if not is_undefined(_abil_map) {
		_val[0] = 0.25 * (_abil_map[? "multiply_rate"] + 1)
		sc_logging("Calc_rating", _a_name , "multiply damage : ", (_abil_map[? "multiply"] + 1))
		sc_logging("Calc_rating", _a_name , "multiply damage rate: ", _val[0])
		_val[1] = (1 - _val[0]) / (_abil_map[? "multiply"] + 1)
		switch _abil_map[? "multiply"] {
			case 0: {
				_val[2] = 1
				break
				}
			case 1: {
				_val[2] = 1 + _val[1]
				break
				}
			case 2: {
				_val[2] = 1 + _val[1] * 2
				break
				}
			case 3: {
				_val[2] = 1 + _val[1] * 3
				break
				}
		}
	}
	_cur_rate *= _val[2]
	sc_logging("Calc_rating", _a_name , "multiply damage rating mod * ", _val[2])
	//=======================================================================================

	if is_undefined(_abil_map)
		sc_logging("Calc_rating", _a_name , "no state ")
	else {
			_cur_rate += sc_calc_rate_ability_state(_abil_map, _a_name, _a_map[? "damage"])
	}

	if not is_undefined(_abil_map) {
		ds_map_destroy(_abil_map)	
	}

	//=======================================================================================
	_val[0] = _a_map[? "repeatable"] 
	if _val[0] > 0 {
		_cur_rate *= 0.5
		sc_logging("Calc_rating", _a_name , "attack disposable - rate * 0.5")
	} else {
		sc_logging("Calc_rating", _a_name , "attack reusable - rate no changed")
	}

	//=======================================================================================
	_val[0] = _a_map[? "warmup"]
	_val[1] = _a_map[? "delay"]
	_val[2] = _a_map[? "accuracy"]

	sc_logging("Calc_rating", _a_name , "warmup - ", (_val[0] * 20))
	sc_logging("Calc_rating", _a_name , "delay - ", (_val[1] * 10))
	sc_logging("Calc_rating", _a_name , "accuracy " + string(_cur_rate) + " * ", _val[2])
	
	_cur_rate -= _val[0] * 20
	_cur_rate -= _val[1] * 10
	_cur_rate = _cur_rate * _val[2]

	_val[0] = 0; _val[1] = 0; _val[2] = 0
	//=======================================================================================

	sc_logging("Calc_rating", _a_name , "final rating", _cur_rate)
	return _cur_rate



}
