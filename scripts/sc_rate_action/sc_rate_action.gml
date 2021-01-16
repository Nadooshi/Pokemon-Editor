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
	_cur_rate += (60 - _val[1]) //for ap
	_val[4] = _val[3] / _val[2] // percentage ratio of damage
	sc_logging("Calc_rating", _a_name , "ap value +", (60 - _val[1]))

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
	_val[0] = _a_map[? "repeatable"] 
	if _val[0] > 0 {
		_cur_rate *= 0.5
		sc_logging("Calc_rating", _a_name , "attack disposable - rate * 0.5")
	} else {
		sc_logging("Calc_rating", _a_name , "attack reusable - rate no changed")
	}

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
		sc_logging("Calc_rating", _a_name , "no state ", 0)
		else {
		_val[0] = 0.25 * (_abil_map[? "state_rate"] + 1)
		switch _abil_map[? "state"]{
			case 0: break;
			case 1: {	// горение
				_val[1] = 5
				_val[2] = _abil_map[? "state_value"]
				_val[3] = _abil_map[? "state_time"]
				_cur_rate += (_val[1] + _val[2] * _val[3]) * _val[0]
				sc_logging("Calc_rating", _a_name , "state incineration +", ((_val[1] + _val[2] * _val[3]) * _val[0]))
				break
			}
			case 2: {	// ожог
				_val[1] = 30
				_val[2] = _abil_map[? "state_time"]
				_cur_rate += (_val[1] * _val[2]) * _val[0]
				sc_logging("Calc_rating", _a_name , "state scar +", ((_val[1] * _val[2]) * _val[0]))
				break
			}
			case 3: {	// кровотечение
				_val[1] = 5
				_val[2] = _abil_map[? "state_value"]
				_val[3] = _abil_map[? "state_time"]
				_cur_rate += (_val[1] + _val[2] * _val[3]) * _val[0]
				sc_logging("Calc_rating", _a_name , "state bleeding +", ((_val[1] + _val[2] * _val[3]) * _val[0]))
				break
			}
			case 4: {	// пиявка
				_val[1] = 10
				_val[2] = _abil_map[? "state_value"]
				_val[3] = _abil_map[? "state_time"]
				_cur_rate += (_val[1] + _val[2] * _val[3]) * _val[0]
				sc_logging("Calc_rating", _a_name , "state leech +", ((_val[1] + _val[2] * _val[3]) * _val[0]))
				break
			}
			case 5: {	// отравление
				_val[1] = 5
				_val[2] = _abil_map[? "state_value"]
				_val[3] = _abil_map[? "state_time"]
				_cur_rate += (_val[1] + _val[2] * _val[3]) * _val[0]
				sc_logging("Calc_rating", _a_name , "state infestation +", ((_val[1] + _val[2] * _val[3]) * _val[0]))
				break
			}
			case 6: {	// парализация
				_val[1] = 15
				_val[2] = _abil_map[? "state_time"]
				_cur_rate += (_val[1] * _val[2]) * _val[0]
				sc_logging("Calc_rating", _a_name , "state paralyze +", ((_val[1] * _val[2]) * _val[0]))
				break
			}
			case 7: {	// +1 к атаке
				_val[1] = 7
				_val[2] = _abil_map[? "state_value"] * 0.1
				_val[3] = _abil_map[? "state_time"]
				_cur_rate += (_val[1] + _val[2] * _val[3]) * _val[0]
				sc_logging("Calc_rating", _a_name , "state gain damage +", ((_val[1] + _val[2] * _val[3]) * _val[0]))
				break
			}
			case 8: {	// слабость
				_val[1] = 7
				_val[2] = _abil_map[? "state_value"] * 0.1
				_val[3] = _abil_map[? "state_time"]
				_cur_rate += (_val[1] + _val[2] * _val[3]) * _val[0]
				sc_logging("Calc_rating", _a_name , "state weak +", ((_val[1] + _val[2] * _val[3]) * _val[0]))
				break
			}
			case 9: {	// +1 к ОД
				_val[1] = 10
				_val[2] = _abil_map[? "state_value"]
				_val[3] = _abil_map[? "state_time"]
				_cur_rate += (_val[1] * _val[2] * _val[3]) * _val[0]
				sc_logging("Calc_rating", _a_name , "state gain speed +", ((_val[1] * _val[2] * _val[3]) * _val[0]))
				break
			}
			case 10: {	// замедление
				_val[1] = 10
				_val[2] = _abil_map[? "state_value"]
				_val[3] = _abil_map[? "state_time"]
				_cur_rate += (_val[1] * _val[2] * _val[3]) * _val[0]
				sc_logging("Calc_rating", _a_name , "state slowdown +", ((_val[1] * _val[2] * _val[3]) * _val[0]))
				break
			}
			case 11: {	// ловушка
				_val[1] = 7
				_val[2] = _abil_map[? "state_value"]
				_val[3] = _abil_map[? "state_time"]
				_cur_rate += (_val[1] + _val[2] + _val[3]) * _val[0]
				sc_logging("Calc_rating", _a_name , "state trap +", ((_val[1] + _val[2] * _val[3]) * _val[0]))
				break
			}
			case 12: {	// случайный урон
				_val[1] = _abil_map[? "state_value"]
				_val[2] = _a_map[? "damage"] * 0.2
				switch _val[1] {
					case 0: {
						_cur_rate += _val[2] * 0.5 *_val[0]
						sc_logging("Calc_rating", _a_name , "state random damage0 +", (_val[2] * 0.5 *_val[0]))
						break
					}
					case 1: {
						_cur_rate += _val[2] *_val[0]
						sc_logging("Calc_rating", _a_name , "state random damage1 +", (_val[2] *_val[0]))
						break
					}
					case 2: {
						_cur_rate += _val[2] * 1.5 *_val[0]
						sc_logging("Calc_rating", _a_name , "state random damage2 +", (_val[2] * 1.5 *_val[0]))
						break
					}
					case 3: {
						_cur_rate += _val[2]* 2 *_val[0]
						sc_logging("Calc_rating", _a_name , "state random damage3 +", (_val[2]* 2 *_val[0]))
						break
					}
				}
				break
			}
			case 13: {	// усыпление
				_val[1] = 20
				_val[2] = _abil_map[? "state_time"]
				_cur_rate += (_val[1] + 2 * _val[2]) * _val[0]
				sc_logging("Calc_rating", _a_name , "state lulling +", ((_val[1] + 2 * _val[2]) * _val[0]))
				break
			}
			case 14: {	// ошеломление
				_val[1] = 30
				_val[2] = _abil_map[? "state_time"]
				_cur_rate += (_val[1] + 5 * _val[2]) * _val[0]
				sc_logging("Calc_rating", _a_name , "state stun +", ((_val[1] + 5 * _val[2]) * _val[0]))
				break
			}
			case 15: {	// ужас
				_val[1] = 15
				_val[2] = _abil_map[? "state_time"]
				_cur_rate += (_val[1] + _val[2]) * _val[0]
				sc_logging("Calc_rating", _a_name , "state fear +", ((_val[1] + _val[2] * _val[3]) * _val[0]))
				break
			}
			case 16: {	// побег
				_val[1] = 8
				_val[2] = _abil_map[? "state_time"]
				_cur_rate += (_val[1] * _val[2]) * _val[0]
				sc_logging("Calc_rating", _a_name , "state escape +", ((_val[1] * _val[2]) * _val[0]))
				break
			}
			case 17: {	// пропуск хода
				_val[1] = 10
				_val[2] = _abil_map[? "state_time"]
				_cur_rate += (_val[1] * _val[2]) * _val[0]
				sc_logging("Calc_rating", _a_name , "state waste time +", ((_val[1] * _val[2]) * _val[0]))
				break
			}
			case 18: {	// отвращение
				_val[1] = 25
				_val[2] = _abil_map[? "state_time"]
				_cur_rate += (_val[1] + 5 * _val[2]) * _val[0]
				sc_logging("Calc_rating", _a_name , "state disgust +", ((_val[1] + 5 * _val[2]) * _val[0]))
				break
			}
			case 19: {	// прицел
				_val[1] = 30 
				_val[2] = _abil_map[? "state_value"] * 0.1
				_val[3] = _abil_map[? "state_time"]
				_cur_rate += (_val[1] + _val[2] * _val[3]) * _val[0]
				sc_logging("Calc_rating", _a_name , "state target +", ((_val[1] + _val[2] * _val[3]) * _val[0]))
				break
			}
			case 20: {	// неуклюжесть
				_val[1] = 30 
				_val[2] = _abil_map[? "state_value"] * 0.1
				_val[3] = _abil_map[? "state_time"]
				_cur_rate += (_val[1] + _val[2] * _val[3]) * _val[0]
				sc_logging("Calc_rating", _a_name , "state loser +", ((_val[1] + _val[2] * _val[3]) * _val[0]))
				break
			}
			case 21: {	// отдача
				_val[1] = 4
				_val[2] = _abil_map[? "state_time"]
				_cur_rate += (_val[1] * _val[2]) * _val[0]
				sc_logging("Calc_rating", _a_name , "state knockback +", ((_val[1] * _val[2]) * _val[0]))
				break
			}
			case 22: {	// взрыв
				_val[1] = 10
				_val[2] = _abil_map[? "state_value"] * 0.2
				_val[3] = _abil_map[? "state_time"]
				_cur_rate += (_val[1] + _val[2] + _val[3]) * _val[0]
				sc_logging("Calc_rating", _a_name , "state explode +", ((_val[1] + _val[2] * _val[3]) * _val[0]))
				break
			}
			case 23: {	// месть
				_val[1] = 7
				_val[2] = _abil_map[? "state_time"]
				_cur_rate += (_val[1] + _val[2]) * _val[0]
				sc_logging("Calc_rating", _a_name , "state revenge +" , ((_val[1] + _val[2]) * _val[0]))
				break
			}
			case 24: {	// камикадзе
				break
			}
			case 25: {	// гипноз
				_val[1] = 35
				_val[2] = _abil_map[? "state_time"]
				_cur_rate += _val[1] * _val[2] * _val[0]
				sc_logging("Calc_rating", _a_name , "state Hypnotize +", (_val[1] * _val[2] * _val[0]))
				break
			}
			case 26: {	// смущение
				_val[1] = 25
				_val[2] = _abil_map[? "state_value"] * 0.1
				_val[3] = _abil_map[? "state_time"]
				_cur_rate += (_val[1] + _val[2] * _val[3]) * _val[0]
				sc_logging("Calc_rating", _a_name , "state confusion +", ((_val[1] + _val[2] * _val[3]) * _val[0]))
				break
			}
			case 27: {	// телекинез
				_val[1] = 15
				_val[2] = 50 / _abil_map[? "state_value"]
				_val[3] = _abil_map[? "state_time"]
				_cur_rate += (_val[1] + _val[2] * _val[3]) * _val[0]
				sc_logging("Calc_rating", _a_name , "state telekinetic +", ((_val[1] + _val[2] * _val[3]) * _val[0]))
				break
			}
			case 28: {	// телепортация
				_val[1] = 20 
				_val[2] = _abil_map[? "state_value"]
				_val[3] = _abil_map[? "state_time"]
				_cur_rate += (_val[1] + _val[2] * _val[3]) * _val[0]
				sc_logging("Calc_rating", _a_name , "state teleport +", ((_val[1] + _val[2] * _val[3]) * _val[0]))
				break
			}
			case 29: {	// буст ближняя
				_val[1] = 3 
				_val[2] = _abil_map[? "state_value"] * 0.1
				_val[3] = _abil_map[? "state_time"]
				_cur_rate += (_val[1] + _val[2] * _val[3]) * _val[0]
				sc_logging("Calc_rating", _a_name , "state meleeup +", ((_val[1] + _val[2] * _val[3]) * _val[0]))
				break
			}
			case 30: {	// буст дальняя
				_val[1] = 4
				_val[2] = _abil_map[? "state_value"] * 0.1
				_val[3] = _abil_map[? "state_time"]
				_cur_rate += (_val[1] + _val[2] * _val[3]) * _val[0]
				sc_logging("Calc_rating", _a_name , "state rangeup +", ((_val[1] + _val[2] * _val[3]) * _val[0]))
				break
			}
			case 31: {	// лечение 1
				_val[1] = 15
				_val[2] = _abil_map[? "state_value"]
				_val[3] = _abil_map[? "state_time"]
				_cur_rate += (_val[1] + _val[2] * _val[3]) * _val[0]
				sc_logging("Calc_rating", _a_name , "state heal +", ((_val[1] + _val[2] * _val[3]) * _val[0]))
				break
			}
			case 32: {	// лечение 2
				_val[1] = 25
				_val[2] = _abil_map[? "state_value"]
				_val[3] = _abil_map[? "state_time"]
				_cur_rate += (_val[1] + _val[2] * _val[3]) * _val[0]
				sc_logging("Calc_rating", _a_name , "state cure +", ((_val[1] + _val[2] * _val[3]) * _val[0]))
				break
			}
			case 33: {	// лечение 3
				_val[1] = 40
				_val[2] = _abil_map[? "state_value"]
				_val[3] = _abil_map[? "state_time"]
				_cur_rate += (_val[1] + _val[2] * _val[3]) * _val[0]
				sc_logging("Calc_rating", _a_name , "state medicine +", ((_val[1] + _val[2] * _val[3]) * _val[0]))
				break
			}
			case 34: {	// снятие эффектов
				_val[1] = 30
				_val[2] = _abil_map[? "state_time"]
				_cur_rate += (_val[1] + _val[2]) * _val[0]
				sc_logging("Calc_rating", _a_name , "state clear +", ((_val[1] + _val[2]) * _val[0]))
				break
			}
			case 35: {	// уверенность
				_val[1] = 25
				_val[2] = _abil_map[? "state_value"]
				_val[3] = _abil_map[? "state_time"]
				_cur_rate += (_val[1] + _val[2]) * _val[0]
				sc_logging("Calc_rating", _a_name , "state confidance +", ((_val[1] + _val[2] * _val[3]) * _val[0]))
				break
			}
			case 36: {	// отражение
				_val[1] = 20
				_val[2] = _abil_map[? "state_time"]
				_cur_rate += (_val[1] + 3 * _val[2]) * _val[0]
				sc_logging("Calc_rating", _a_name , "state reflect +", ((_val[1] + 3 * _val[2]) * _val[0]))
				break
			}
			case 37: {	// поглощение
				_val[1] = 15
				_val[2] = _abil_map[? "state_value"] * 0.1
				_val[3] = _abil_map[? "state_time"]
				_cur_rate += (_val[1] + _val[2] * _val[3]) * _val[0]
				sc_logging("Calc_rating", _a_name , "state block +", ((_val[1] + _val[2] * _val[3]) * _val[0]))
				break
			}
			case 38: {	// ловкость
				_val[1] = 20
				_val[2] = _abil_map[? "state_value"] * 0.1
				_val[3] = _abil_map[? "state_time"]
				_cur_rate += (_val[1] + _val[2] * _val[3]) * _val[0]
				sc_logging("Calc_rating", _a_name , "state dextery +", ((_val[1] + _val[2] * _val[3]) * _val[0]))
				break
			}
			case 39: {	// обоюдный урон
				_val[1] = 5
				_val[2] = _abil_map[? "state_value"] * 0.1
				_cur_rate -= (_val[1] + _val[2]) * (1 - _val[0]) // minus
				sc_logging("Calc_rating", _a_name , "state desperate -", ((_val[1] + _val[2]) * 1 - _val[0]))
				break
			}
			case 40: {	// трещина
				_val[1] = 25
				_val[2] = _abil_map[? "state_time"]
				_cur_rate += (_val[1] + _val[2]) * _val[0]
				sc_logging("Calc_rating", _a_name , "state wreak +", ((_val[1] + _val[2]) * _val[0]))
				break
			}
			case 41: {	// барьер
				_val[1] = 15 
				_val[2] = _abil_map[? "state_value"] * 0.15
				_val[3] = _abil_map[? "state_time"]
				_cur_rate += (_val[1] + _val[2] * _val[3]) * _val[0]
				sc_logging("Calc_rating", _a_name , "state barierre +", ((_val[1] + _val[2] * _val[3]) * _val[0]))
				break
			}
		}
	}	
	
	if not is_undefined(_abil_map) {
		ds_map_destroy(_abil_map)	
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
