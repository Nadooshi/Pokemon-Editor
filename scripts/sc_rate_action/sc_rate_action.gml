///@desc Calculate raiting for action
///@arg action_map
function sc_rate_action(_a_map, _abil_map) {

	var _cur_rate = 0
	var _val = 0
	var _type = ds_map_find_value(_a_map,"type")
	var _abil = _a_map[? "active"]

	switch _type {
		case _ATTACK_TYPE.front: {
			_val[0] = ds_map_find_value(_a_map,"ap")
			_cur_rate += 15 * max((10 - _val[0] * 0.1),1)
			break; 
		}
		case _ATTACK_TYPE.melee: {
			_val[0] = ds_map_find_value(_a_map, "radius")
			_val[1] = ds_map_find_value(_a_map,"ap")
			_cur_rate = (_cur_rate + 20 + _val[0] * 5) * max((10 - _val[1] * 0.1),1)
			break; 
		}
		case _ATTACK_TYPE.lunge: {
			_val[0] = ds_map_find_value(_a_map, "radius")
			_val[1] = ds_map_find_value(_a_map,"range")
			_val[2] = _val[1] * 0.11 + 1
			_cur_rate = _cur_rate + 65 + _val[0] * 25 + power(_val[1], _val[2])
			break; 
		}
		case _ATTACK_TYPE.swoop: {
			_val[0] = ds_map_find_value(_a_map, "radius")
			_val[1] = ds_map_find_value(_a_map,"range")
			_val[2] = _val[1] * 0.12 + 1
			_cur_rate = _cur_rate + 45 + _val[0] * 35 + power(_val[1], _val[2])
			break; 
		}
		case _ATTACK_TYPE.range: {
			_val[0] = ds_map_find_value(_a_map, "radius")
			_val[1] = ds_map_find_value(_a_map,"range")
			_val[2] = _val[1] * 0.10 + 1
			_cur_rate = _cur_rate + 50 + _val[0] * 5 + power(_val[1], _val[2])
			break; 
		}
		case _ATTACK_TYPE.wave: {
			_val[0] = ds_map_find_value(_a_map, "radius")
			_val[1] = ds_map_find_value(_a_map,"range")
			_val[2] = _val[1] * 0.12 + 1
			_cur_rate = _cur_rate + 65 + _val[0] * 25 + power(_val[1], _val[2])
			break; 
		}
		case _ATTACK_TYPE.ray: {
			_val[0] = ds_map_find_value(_a_map, "radius")
			_val[1] = ds_map_find_value(_a_map,"range")
			_val[2] = _val[1] * 0.10 + 1
			_cur_rate = _cur_rate + 60 + _val[0] * 10 + power(_val[1], _val[2])
			break; 
		}
		case _ATTACK_TYPE.mortar: {
			_val[0] = ds_map_find_value(_a_map, "radius")
			_val[1] = ds_map_find_value(_a_map,"range")
			_val[2] = _val[1] * 0.11 + 1
			_cur_rate = _cur_rate + 45 + _val[0] * 20 + power(_val[1], _val[2])
			break; 
		}
		case _ATTACK_TYPE.pool: {
			_val[0] = ds_map_find_value(_a_map, "radius")
			_val[1] = ds_map_find_value(_a_map,"range")
			_val[2] = _val[1] * 0.05 + 1
			_cur_rate = _cur_rate + 40 + _val[0] * 30 + power(_val[1], _val[2])
			break; 
		}
		case _ATTACK_TYPE.cloud: {
			_val[0] = ds_map_find_value(_a_map, "radius")
			_val[1] = ds_map_find_value(_a_map,"range")
			_val[2] = _val[1] * 0.06 + 1
			_cur_rate = _cur_rate + 40 + _val[0] * 30 + power(_val[1], _val[2])
			break; 
		}
		case _ATTACK_TYPE.aura: {
			_val[1] = ds_map_find_value(_a_map,"range")
			_val[2] = _val[1] * 0.13 + 1
			_cur_rate += 80 + power(_val[1], _val[2])
			break; 
		}
		case _ATTACK_TYPE.barrier: {
			_val[0] = ds_map_find_value(_a_map, "radius")
			_val[1] = ds_map_find_value(_a_map,"range")
			_val[2] = _val[1] * 0.08 + 1
			_val[3] = ceil(ds_map_find_value(_a_map, "damage") * 0.1)
			_cur_rate = _cur_rate + (5 + power(_val[1], _val[2]) + _val[3]) * (_val[0] + 1)
			break; 
		}
	}
	_val[0] = 0; _val[1] = 0; _val[2] = 0; _val[3] = 0;

	//=======================================================================================
	switch ds_map_find_value(_a_map,"bullet_phys") {
		case _BULLET_PH.custom:{
			_cur_rate += 0
			break;
		}
		case _BULLET_PH.soft:{
			_cur_rate -= 15 // minus
			break;
		}
		case _BULLET_PH.chain:{
			_cur_rate += 35
			break;
		}
		case _BULLET_PH.piercer:{
			_cur_rate += 25
			break;
		}
		case _BULLET_PH.bowl:{
			_cur_rate += 15
			break;
		}
	}

	//=======================================================================================
	var tgRates = [4, 4];
	tgRates[_ATTACK_TG.air,		 _ATTACK_TG.air	]		= 0
	tgRates[_ATTACK_TG.air,		 _ATTACK_TG.ground]		= 2
	tgRates[_ATTACK_TG.air,		 _ATTACK_TG.underground]= 5
	tgRates[_ATTACK_TG.ground,	 _ATTACK_TG.air	]		= 3
	tgRates[_ATTACK_TG.ground,	 _ATTACK_TG.ground]		= 0
	tgRates[_ATTACK_TG.ground,	 _ATTACK_TG.underground]= 4
	tgRates[_ATTACK_TG.underground, _ATTACK_TG.air	]	= 3
	tgRates[_ATTACK_TG.underground, _ATTACK_TG.ground]	= 1
	tgRates[_ATTACK_TG.underground, _ATTACK_TG.underground]	= 0

	var _iFrom = 1
	var _iTo = 1
	for(var i=1; i<=3; i++) {
		if _a_map[? "tgFrom"] & _iFrom {
			_iTo = 1
			for(var j=1; j<=3; j++) {
				if _a_map[? "tgTo"] & _iTo
					_cur_rate += tgRates[_iFrom, _iTo]
				_iTo = _iTo << 1
			}
		}
		_iFrom = _iFrom << 1
	}

	//=======================================================================================

	_val[0] = ds_map_find_value(_a_map,"level")
	_val[1] = ds_map_find_value(_a_map,"ap")
	_val[2] = sc_calculate_formula(4,0,_val[0],_val[1]) // calculate 'ideal' damage
	_val[3] = ds_map_find_value(_a_map, "damage")
	_cur_rate += (50 - _val[1]) //for ap
	_val[4] = _val[3] / _val[2] // percentage ratio of damage

	if _val[3] != 0 {
		if _type = _ATTACK_TYPE.barrier
			_cur_rate += _val[3]*_val[4]
		else
			_cur_rate = _cur_rate*_val[4]
	} else {
		if is_undefined(_abil) or _abil = "" {
			_cur_rate = 0
		}
	}

	for (var i = 0; i < 5; i++)
		_val[i] = 0
	//=======================================================================================
	if not ds_map_find_value(_a_map,"repeatable")
		_cur_rate *= 0.5

	//=======================================================================================
	var _abil_loaded = false

	if not is_undefined(_abil) or not _abil = "" {
		_abil_loaded = not ds_map_empty(_abil_map)
		
		if not _abil_loaded {
			ds_map_read(_abil_map, bini_sections[? "abilities"][? _abil])
			show_debug_message("New ability loaded for rating")
		} else
		if _abil_map[? "name"] != _abil {
			ds_map_read(_abil_map, bini_sections[? "abilities"][? _abil])
			show_debug_message("New ability loaded for rating")
		}
		_val[0] = (_abil_map[? "multiply"] + 1)
		_val[1] = 0.25 * (_abil_map[? "multiply_rate"] +1)
		_cur_rate += (_cur_rate * _val[1]) * _val[0]	
	}
	//=======================================================================================
	_val[0] = _a_map[? "warmup"]
	_val[1] = _a_map[? "delay"]
	_val[2] = _a_map[? "accuracy"]

	_cur_rate -= _val[0] * 25
	_cur_rate -= _val[1] * 10
	_cur_rate = _cur_rate * _val[2]
	_val[0] = 0; _val[1] = 0; _val[2] = 0
	//=======================================================================================

	return _cur_rate



}
