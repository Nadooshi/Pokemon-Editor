///@desc Calculate raiting for action
///@arg action_map
function sc_rate_action(_a_map, _abil_map) {

	var _cur_rate = 0
	var _val = 0
	var _type = ds_map_find_value(_a_map,"type")
	var _abil_loaded = false
	var _dmg = ds_map_find_value(_a_map, "damage")
	
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
	sc_logging("Value rating for physic interaction of action", _a_name, undefined, undefined)
	//=======================================================================================
	switch _type {
		case _ATTACK_TYPE.front: {
			_val[0] = ds_map_find_value(_a_map,"ap")
			_cur_rate += 15 * max((10 - _val[0] * 0.1),1)
			sc_logging("	", undefined , "action type is Front, rated", _cur_rate)
			break; 
		}
		case _ATTACK_TYPE.melee: {
			_val[0] = ds_map_find_value(_a_map, "radius")
			_val[1] = ds_map_find_value(_a_map,"ap")
			_cur_rate = (_cur_rate + 20 + _val[0] * 5) * max((10 - _val[1] * 0.1),1)
			sc_logging("	", undefined , "action type is Melee, rated", _cur_rate)
			break; 
		}
		case _ATTACK_TYPE.lunge: {
			_val[0] = ds_map_find_value(_a_map,"range")
			_val[1] = _val[0] * 0.09 + 1
			_cur_rate = _cur_rate + 55 + power(_val[0], _val[1])
			sc_logging("	", undefined , "action type is Lunge, rated", _cur_rate)
			break; 
		}
		case _ATTACK_TYPE.swoop: {
			_val[0] = ds_map_find_value(_a_map,"range")
			_val[1] = _val[0] * 0.09 + 1
			_cur_rate = _cur_rate + 45 + power(_val[0], _val[1])
			sc_logging("	", undefined , "action type is Swoop, rated", _cur_rate)
			break; 
		}
		case _ATTACK_TYPE.range: {
			_val[0] = ds_map_find_value(_a_map, "radius")
			_val[1] = ds_map_find_value(_a_map,"range")
			_val[2] = _val[1] * 0.07 + 1
			_cur_rate = _cur_rate + 35 + _val[0] * 5 + power(_val[1], _val[2])
			sc_logging("	", undefined , "action type is Range, rated", _cur_rate)
			break; 
		}
		case _ATTACK_TYPE.wave: {
			_val[0] = ds_map_find_value(_a_map, "radius")
			_val[1] = ds_map_find_value(_a_map,"range")
			_val[2] = _val[1] * 0.10 + 1
			_cur_rate = _cur_rate + 65 + _val[0] * 25 + power(_val[1], _val[2])
			sc_logging("	", undefined , "action type is Wave, rated", _cur_rate)
			break; 
		}
		case _ATTACK_TYPE.ray: {
			_val[0] = ds_map_find_value(_a_map, "radius")
			_val[1] = ds_map_find_value(_a_map,"range")
			_val[2] = _val[1] * 0.08 + 1
			_cur_rate = _cur_rate + 50 + _val[0] * 10 + power(_val[1], _val[2])
			sc_logging("	", undefined , "action type is Ray, rated", _cur_rate)
			break; 
		}
		case _ATTACK_TYPE.mortar: {
			_val[0] = ds_map_find_value(_a_map, "radius")
			_val[1] = ds_map_find_value(_a_map,"range")
			_val[2] = _val[1] * 0.09 + 1
			_cur_rate = _cur_rate + 25 + _val[0] * 20 + power(_val[1], _val[2])
			sc_logging("	", undefined , "action type is mortar, rated", _cur_rate)
			break; 
		}
		case _ATTACK_TYPE.pool: {
			_val[0] = ds_map_find_value(_a_map, "radius")
			_val[1] = ds_map_find_value(_a_map,"range")
			_val[2] = _val[1] * 0.03 + 1
			_cur_rate = _cur_rate + 15 + _val[0] * 15 + power(_val[1], _val[2])
			sc_logging("	", undefined , "action type is Pool, rated", _cur_rate)
			break; 
		}
		case _ATTACK_TYPE.cloud: {
			_val[0] = ds_map_find_value(_a_map, "radius")
			_val[1] = ds_map_find_value(_a_map,"range")
			_val[2] = _val[1] * 0.04 + 1
			_cur_rate = _cur_rate + 20 + _val[0] * 20 + power(_val[1], _val[2])
			sc_logging("	", undefined , "action type is Cloud, rated", _cur_rate)
			break; 
		}
		case _ATTACK_TYPE.aura: {
			_val[1] = ds_map_find_value(_a_map,"range")
			_val[2] = _val[1] * 0.11 + 1
			_cur_rate += 65 + power(_val[1], _val[2])
			sc_logging("	", undefined , "action type is Aura, rated", _cur_rate)
			break; 
		}
		case _ATTACK_TYPE.barrier: {
			_val[0] = ds_map_find_value(_a_map, "radius")
			_val[1] = ds_map_find_value(_a_map,"range")
			_val[2] = _val[1] * 0.06 + 1
			_val[3] = ceil(ds_map_find_value(_a_map, "damage") * 0.1)
			_cur_rate = _cur_rate + (5 + power(_val[1], _val[2]) + _val[3]) * (_val[0] + 1)
			sc_logging("	", undefined , "action type is Barrier, rated", _cur_rate)
			break; 
		}
	}
	_val[0] = 0; _val[1] = 0; _val[2] = 0; _val[3] = 0;

	//=======================================================================================
	var mod_rate = 0
	switch ds_map_find_value(_a_map,"bullet_phys") {
		case _BULLET_PH.custom:{
			mod_rate = 15
			sc_logging("	", undefined , "bullet is General", mod_rate)
			break;
		}
		case _BULLET_PH.soft:{
			mod_rate = 0
			sc_logging("	", undefined , "bullet is Soft", mod_rate)
			break;
		}
		case _BULLET_PH.chain:{
			mod_rate = 55
			sc_logging("	", undefined , "bullet is Chain", mod_rate)
			break;
		}
		case _BULLET_PH.piercer:{
			mod_rate = 25
			sc_logging("	", undefined , "bullet is Piercer", mod_rate)
			break;
		}
		case _BULLET_PH.bowl:{
			mod_rate = 35
			sc_logging("	", undefined , "bullet is Bowl", mod_rate)
			break;
		}
	}
	_cur_rate += mod_rate
	
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
	sc_logging("	", undefined , "coverage of targets", _val[0])
	
	_val[0] = 0; mod_rate = 0
	
	//=======================================================================================
	sc_logging("------------------------------------------------", undefined, undefined, undefined)
	sc_logging("Rating battle values", _a_name, ":", undefined)

	_val[0] = 1
	_val[1] = 0
	_val[2] = 1
	if not is_undefined(_abil_map) {
		_val[3] = _abil_map[? "multiply"] + 1
		_val[0] = 0.25 * (_abil_map[? "multiply_rate"] + 1)
		_val[1] = (1 - _val[0]) / _val[3]
		_val[2] = 1 + _val[1] * _abil_map[? "multiply"]
		
	}
	mod_rate = _dmg * _val[2]
	
	sc_logging("	", undefined, "multiply damage modify rating at x" + string(_val[2]), undefined)
	sc_logging("	", undefined, "damage multiplier x" + string(_val[3]), undefined)
	sc_logging("	", undefined, "rate multiplier " + string(_val[0] * 100)+ "%", undefined)
	sc_logging("	", undefined, "clear custom damage", _dmg)
	sc_logging("	", undefined, "custom damage with multiplier", mod_rate)
	_val[0] = 0; _val[1] = 0; _val[2] = 0; _val[3] = 0;

	//=======================================================================================
	_val[0] = ds_map_find_value(_a_map,"level")
	_val[1] = ds_map_find_value(_a_map,"ap")
	_val[2] = sc_calculate_formula(3,_FORCE.elite,_val[0], _val[1]) // calculate ideal damage
	_val[3] = mod_rate // damage with multiplier
	_val[4] = _val[3] / _val[2] // percentage ratio ideal to real damage
	mod_rate = (50 - _val[1]) * 2.5 //for ap
	_cur_rate += mod_rate
	sc_logging("	", "cost AP", undefined, mod_rate)
	mod_rate = 0
	_cur_rate += _val[3] * _val[4]

	if _val[3] != 0 
		if _type = _ATTACK_TYPE.barrier {
			sc_logging("	", attack_type_text[_type], "endurance", (_val[3]*_val[4]))
		} else {
			sc_logging("	", "Valuation rating of custom damage:", undefined, undefined)
			sc_logging("		", "value ideal damage", undefined, _val[2])
			sc_logging("		", "custom value damage", undefined, _val[3])
			sc_logging("		", "difference of custom/ideal damage", string(_val[4]* 100) + "%", undefined)
			sc_logging("		", attack_type_text[_type], "rate value for "+ _a_name + " damage", (_val[3] * _val[4]))
		}
	else 
		if is_undefined(_abil_map) {
			_cur_rate = 0
			sc_logging("Because", attack_type_text[_type], "damage value = 0, value of raiting for action " + _a_name, 0)
			return _cur_rate
		}


	for (var i = 0; i < 5; i++)
		_val[i] = 0


	//=======================================================================================
	sc_logging("------------------------------------------------", undefined, undefined, undefined)
	sc_logging("Rating for state:", undefined, undefined, undefined)
	if is_undefined(_abil_map)
		sc_logging("Action", _a_name , "has no states!")
	else {
			_cur_rate += sc_calc_rate_ability_state(_abil_map, _a_name, _a_map[?"role"], _a_map[? "damage"])
	}

	if not is_undefined(_abil_map) {
		ds_map_destroy(_abil_map)	
	}

	//=======================================================================================
	_val[0] = _a_map[? "repeatable"] 
	if _val[0] > 0 {
		_cur_rate *= 0.5
		sc_logging("Action", _a_name , "is disposable - rate * 0.5", undefined)
	} else {
		sc_logging("Action", _a_name , "is reusable - rate no changed", undefined)
	}

	//=======================================================================================
	_val[0] = _a_map[? "warmup"]
	_val[1] = _a_map[? "delay"]
	_val[2] = _a_map[? "accuracy"]
	_val[3] = _a_map[? "affect"]

	sc_logging("Rating", "decline due to", "warming up", (_val[0] * -20))
	sc_logging("Rating", "decline due to", "delay", (_val[1] * -10))
	sc_logging("Rating", "multiplier from percentage of accuracy " + string(_val[2] * 100) + "% Multiplier", (_val[2] / 2))
	
	_cur_rate -= _val[0] * 20
	_cur_rate -= _val[1] * 10
	_cur_rate = _cur_rate * _val[2] / 2
	
	if (_val[3] & _ATTACK_AFFECT.enemy) = _ATTACK_AFFECT.enemy
	if _a_map[? "role"] = _ATTACK_ROLE.buff {
		_cur_rate *= 0.67
		sc_logging("Attention!", "The action has a positive effect on enemy.", "Raiting -33%", undefined)
	}
	if (_val[3] & _ATTACK_AFFECT.friend) = _ATTACK_AFFECT.friend
	if _a_map[? "role"] = _ATTACK_ROLE.debuff {
		_cur_rate *= 0.67
		sc_logging("Attention!", "The action has a negative effect on friendly.", "Raiting -33%", undefined)
	}
	if (_val[3] & _ATTACK_AFFECT.itself) = _ATTACK_AFFECT.itself
	if _a_map[? "role"] = _ATTACK_ROLE.debuff {
		_cur_rate *= 0.67
		sc_logging("Attention!", "The action has a negative effect on self.", "Raiting -33%", undefined)
	}
		
	//=======================================================================================
	sc_logging("------------------------------------------------", undefined, undefined, undefined)

	sc_logging("Final rating", "of action" , _a_name, _cur_rate)
	return _cur_rate



}
