function sc_rate_pokemon(_pokemon_map) {
	//@ desc Calculate rating for pokemon
	///@arg pokemon_map

	var _cur_rate = 0
	var _ap = _pokemon_map[? "ap"]
	var _val = []
		
	var _s = bini_sections[? "abilities"][? _pokemon_map[? "passive_1"]]
	if not is_undefined(_s) {
		var _pass_abil1 = ds_map_create()
		ds_map_read(_pass_abil1, _s)
	} else
		_pass_abil1 = undefined

	var _s = bini_sections[? "abilities"][? _pokemon_map[? "passive_2"]]
	if not is_undefined(_s) {
		var _pass_abil2 = ds_map_create()
		ds_map_read(_pass_abil2, _s)
	} else
		_pass_abil2 = undefined

	
	//==============================================================
	var _s
	var _p_name = _pokemon_map[? "title"]
	switch _pokemon_map[? "size"] {
		case _SIZE.tiny :{
			_s = (_ap - 4)
			_cur_rate = 5 * _s
			break;
		}
		case _SIZE.normal :{
			_s = (_ap - 5)
			_cur_rate = 5 * _s
			break;
		}
		case _SIZE.big :{
			_s = (_ap - 5)
			_cur_rate = 7 * _s
			break;
		}
		case _SIZE.giant :{
			_s = (_ap - 6)
			_cur_rate = 7 * _s
			break;
		}
	}
	sc_logging("Calc_rating", _p_name , "is " + size_text[_pokemon_map[? "size"]], _cur_rate)

	//==============================================================
	_val[0] = _pokemon_map[? "health"]
	_cur_rate += (_val[0] *0.1) * max(1, _s)
	sc_logging("Calc_rating", _p_name , "ratio of survival", (_val[0] *0.1) * max(1, _s))

	//==============================================================
	//_cur_rate += (9 + _ap) * _ap
	//sc_logging("Calc_rating", _p_name , "speed " + string(_ap)+ " rating value +", ((9 + _ap) * _ap))

	_val[0] = 0; _s = undefined

	//==============================================================
	if _pokemon_map[? "flyable"] > 0 {
		_cur_rate += 15
		sc_logging("Calc_rating", _p_name , "is flyable +", 15)
	}
	if _pokemon_map[? "digable"] > 0 {
		_cur_rate += 20
		sc_logging("Calc_rating", _p_name , "is digable +", 20)
	}

	//==============================================================
	if not is_undefined(_pass_abil1) and _pokemon_map[? "passive_1"] != "" {
		_val[0] = _pass_abil1[? "in_health_sign"]
		_val[1] = _pass_abil1[? "marker_health"]
		if _val[0] != 0
			_val[2] = (100 - _val[1]) * 0.01
		else
			_val[2] = _val[1] * 0.01
		_cur_rate += _val[2] * sc_calc_rate_ability_state(_pass_abil1, _p_name)
	} else 
		sc_logging("Calc_rating", _p_name , "no first passive")
	_val[0] = 0;_val[1] = 0; _val[2] = 0 

	if not is_undefined(_pass_abil2) and _pokemon_map[? "passive_2"] != "" {
		_val[0] = _pass_abil2[? "in_health_sign"]
		_val[1] = _pass_abil2[? "marker_health"]
		if _val[0] != 0
			_val[2] = (100 - _val[1]) * 0.01
		else
			_val[2] = _val[1] * 0.01
		_cur_rate += _val[2] * sc_calc_rate_ability_state(_pass_abil2, _p_name)
	} else 
		sc_logging("Calc_rating", _p_name , "no second passive")
	_val[0] = 0;_val[1] = 0; _val[2] = 0 
	

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

	sc_logging("Calc_rating", _p_name , "average action damage", _val[0])
	sc_logging("Calc_rating", _p_name , "average action rating", _val[1])
	
	_cur_rate += _val[0] + _val[1]

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
	sc_logging("Calc_rating", _p_name , "percentage ratio of health", _val[2])

	_cur_rate = _cur_rate * _val[2]

	_val[0] = 0; _val[1] = 0; _val[2] = 0

	//==============================================================

	sc_logging("Final_rating", "" , "=", _cur_rate)
	return _cur_rate
}


///@arg ability_map
///@arg name
function sc_calc_rate_ability_state(_abil_map, _a_name, _dmg){
var _val = []
var _cur_rate = 0
if is_undefined(_dmg) _dmg = 0

_val[0] = 0.25 * (_abil_map[? "state_rate"] + 1)
switch _abil_map[? "state"]{
	case 0: break;
	case 1: {	// горение
		_val[1] = 5
		_val[2] = _abil_map[? "state_value"]
		_val[3] = _abil_map[? "state_time"] - (_abil_map[? "state_cooldown"] * 0.25)
		_cur_rate += (_val[1] + _val[2] * _val[3]) * _val[0]
		sc_logging("Calc_rating", _a_name , "state incineration +", ((_val[1] + _val[2] * _val[3]) * _val[0]))
		break
	}
	case 2: {	// ожог
		_val[1] = 30
		_val[2] = _abil_map[? "state_time"] - (_abil_map[? "state_cooldown"] * 0.25)
		_cur_rate += (_val[1] * _val[2]) * _val[0]
		sc_logging("Calc_rating", _a_name , "state scar +", ((_val[1] * _val[2]) * _val[0]))
		break
	}
	case 3: {	// кровотечение
		_val[1] = 7
		_val[2] = _abil_map[? "state_value"]
		_val[3] = _abil_map[? "state_time"] - (_abil_map[? "state_cooldown"] * 0.25)
		_cur_rate += (_val[1] + _val[2] * _val[3]) * _val[0]
		sc_logging("Calc_rating", _a_name , "state bleeding +", ((_val[1] + _val[2] * _val[3]) * _val[0]))
		break
	}
	case 4: {	// пиявка
		_val[1] = 10
		_val[2] = _abil_map[? "state_value"]
		_val[3] = _abil_map[? "state_time"] - (_abil_map[? "state_cooldown"] * 0.25)
		_cur_rate += (_val[1] + _val[2] * _val[3]) * _val[0]
		sc_logging("Calc_rating", _a_name , "state leech +", ((_val[1] + _val[2] * _val[3]) * _val[0]))
		break
	}
	case 5: {	// отравление
		_val[1] = 6
		_val[2] = _abil_map[? "state_value"]
		_val[3] = _abil_map[? "state_time"] - (_abil_map[? "state_cooldown"] * 0.25)
		_cur_rate += (_val[1] + _val[2] * _val[3]) * _val[0]
		sc_logging("Calc_rating", _a_name , "state infestation +", ((_val[1] + _val[2] * _val[3]) * _val[0]))
		break
	}
	case 6: {	// парализация
		_val[1] = 15
		_val[2] = _abil_map[? "state_time"] - (_abil_map[? "state_cooldown"] * 0.25)
		_cur_rate += (_val[1] * _val[2]) * _val[0]
		sc_logging("Calc_rating", _a_name , "state paralyze +", ((_val[1] * _val[2]) * _val[0]))
		break
	}
	case 7: {	// +1 к атаке
		_val[1] = 7
		_val[2] = _abil_map[? "state_value"] * 0.1
		_val[3] = _abil_map[? "state_time"] - (_abil_map[? "state_cooldown"] * 0.25)
		_cur_rate += (_val[1] + _val[2] * _val[3]) * _val[0]
		sc_logging("Calc_rating", _a_name , "state gain damage +", ((_val[1] + _val[2] * _val[3]) * _val[0]))
		break
	}
	case 8: {	// слабость
		_val[1] = 7
		_val[2] = _abil_map[? "state_value"] * 0.1
		_val[3] = _abil_map[? "state_time"] - (_abil_map[? "state_cooldown"] * 0.25)
		_cur_rate += (_val[1] + _val[2] * _val[3]) * _val[0]
		sc_logging("Calc_rating", _a_name , "state weak +", ((_val[1] + _val[2] * _val[3]) * _val[0]))
		break
	}
	case 9: {	// +1 к ОД
		_val[1] = 10
		_val[2] = _abil_map[? "state_value"]
		_val[3] = _abil_map[? "state_time"] - (_abil_map[? "state_cooldown"] * 0.25)
		_cur_rate += (_val[1] * _val[2] * _val[3]) * _val[0]
		sc_logging("Calc_rating", _a_name , "state gain speed +", ((_val[1] * _val[2] * _val[3]) * _val[0]))
		break
	}
	case 10: {	// замедление
		_val[1] = 10
		_val[2] = _abil_map[? "state_value"]
		_val[3] = _abil_map[? "state_time"] - (_abil_map[? "state_cooldown"] * 0.25)
		_cur_rate += (_val[1] * _val[2] * _val[3]) * _val[0]
		sc_logging("Calc_rating", _a_name , "state slowdown +", ((_val[1] * _val[2] * _val[3]) * _val[0]))
		break
	}
	case 11: {	// ловушка
		_val[1] = 7
		_val[2] = _abil_map[? "state_value"]
		_val[3] = _abil_map[? "state_time"] - (_abil_map[? "state_cooldown"] * 0.25)
		_cur_rate += (_val[1] + _val[2] + _val[3]) * _val[0]
		sc_logging("Calc_rating", _a_name , "state trap +", ((_val[1] + _val[2] * _val[3]) * _val[0]))
		break
	}
	case 12: {	// случайный урон
		_val[1] = _abil_map[? "state_value"]
		_val[2] = _dmg * 0.2
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
		_val[2] = _abil_map[? "state_time"] - (_abil_map[? "state_cooldown"] * 0.25)
		_cur_rate += (_val[1] + 2 * _val[2]) * _val[0]
		sc_logging("Calc_rating", _a_name , "state lulling +", ((_val[1] + 2 * _val[2]) * _val[0]))
		break
	}
	case 14: {	// ошеломление
		_val[1] = 30
		_val[2] = _abil_map[? "state_time"] - (_abil_map[? "state_cooldown"] * 0.25)
		_cur_rate += (_val[1] + 5 * _val[2]) * _val[0]
		sc_logging("Calc_rating", _a_name , "state stun +", ((_val[1] + 5 * _val[2]) * _val[0]))
		break
	}
	case 15: {	// ужас
		_val[1] = 15
		_val[2] = _abil_map[? "state_time"] - (_abil_map[? "state_cooldown"] * 0.25)
		_cur_rate += (_val[1] + _val[2]) * _val[0]
		sc_logging("Calc_rating", _a_name , "state fear +", ((_val[1] + _val[2]) * _val[0]))
		break
	}
	case 16: {	// побег
		_val[1] = 8
		_val[2] = _abil_map[? "state_time"] - (_abil_map[? "state_cooldown"] * 0.25)
		_cur_rate += (_val[1] * _val[2]) * _val[0]
		sc_logging("Calc_rating", _a_name , "state escape +", ((_val[1] * _val[2]) * _val[0]))
		break
	}
	case 17: {	// пропуск хода
		_val[1] = 10
		_val[2] = _abil_map[? "state_time"] - (_abil_map[? "state_cooldown"] * 0.25)
		_cur_rate += (_val[1] * _val[2]) * _val[0]
		sc_logging("Calc_rating", _a_name , "state waste time +", ((_val[1] * _val[2]) * _val[0]))
		break
	}
	case 18: {	// отвращение
		_val[1] = 25
		_val[2] = _abil_map[? "state_time"] - (_abil_map[? "state_cooldown"] * 0.25)
		_cur_rate += (_val[1] + 5 * _val[2]) * _val[0]
		sc_logging("Calc_rating", _a_name , "state disgust +", ((_val[1] + 5 * _val[2]) * _val[0]))
		break
	}
	case 19: {	// прицел
		_val[1] = 30 
		_val[2] = _abil_map[? "state_value"] * 0.1
		_val[3] = _abil_map[? "state_time"] - (_abil_map[? "state_cooldown"] * 0.25)
		_cur_rate += (_val[1] + _val[2] * _val[3]) * _val[0]
		sc_logging("Calc_rating", _a_name , "state target +", ((_val[1] + _val[2] * _val[3]) * _val[0]))
		break
	}
	case 20: {	// неуклюжесть
		_val[1] = 30 
		_val[2] = _abil_map[? "state_value"] * 0.1
		_val[3] = _abil_map[? "state_time"] - (_abil_map[? "state_cooldown"] * 0.25)
		_cur_rate += (_val[1] + _val[2] * _val[3]) * _val[0]
		sc_logging("Calc_rating", _a_name , "state loser +", ((_val[1] + _val[2] * _val[3]) * _val[0]))
		break
	}
	case 21: {	// отдача
		_val[1] = 4
		_val[2] = _abil_map[? "state_time"] - (_abil_map[? "state_cooldown"] * 0.25)
		_cur_rate += (_val[1] * _val[2]) * _val[0]
		sc_logging("Calc_rating", _a_name , "state knockback +", ((_val[1] * _val[2]) * _val[0]))
		break
	}
	case 22: {	// взрыв
		_val[1] = 10
		_val[2] = _abil_map[? "state_value"] * 0.2
		_val[3] = _abil_map[? "state_time"] - (_abil_map[? "state_cooldown"] * 0.25)
		_cur_rate += (_val[1] + _val[2] + _val[3]) * _val[0]
		sc_logging("Calc_rating", _a_name , "state explode +", ((_val[1] + _val[2] * _val[3]) * _val[0]))
		break
	}
	case 23: {	// месть
		_val[1] = 7
		_val[2] = _abil_map[? "state_time"] - (_abil_map[? "state_cooldown"] * 0.25)
		_cur_rate += (_val[1] + _val[2]) * _val[0]
		sc_logging("Calc_rating", _a_name , "state revenge +" , ((_val[1] + _val[2]) * _val[0]))
		break
	}
	case 24: {	// камикадзе
		break
	}
	case 25: {	// гипноз
		_val[1] = 35
		_val[2] = _abil_map[? "state_time"] - (_abil_map[? "state_cooldown"] * 0.25)
		_cur_rate += _val[1] * _val[2] * _val[0]
		sc_logging("Calc_rating", _a_name , "state Hypnotize +", (_val[1] * _val[2] * _val[0]))
		break
	}
	case 26: {	// смущение
		_val[1] = 25
		_val[2] = _abil_map[? "state_value"] * 0.1
		_val[3] = _abil_map[? "state_time"] - (_abil_map[? "state_cooldown"] * 0.25)
		_cur_rate += (_val[1] + _val[2] * _val[3]) * _val[0]
		sc_logging("Calc_rating", _a_name , "state confusion +", ((_val[1] + _val[2] * _val[3]) * _val[0]))
		break
	}
	case 27: {	// телекинез
		_val[1] = 15
		_val[2] = 50 / _abil_map[? "state_value"]
		_val[3] = _abil_map[? "state_time"] - (_abil_map[? "state_cooldown"] * 0.25)
		_cur_rate += (_val[1] + _val[2] * _val[3]) * _val[0]
		sc_logging("Calc_rating", _a_name , "state telekinetic +", ((_val[1] + _val[2] * _val[3]) * _val[0]))
		break
	}
	case 28: {	// телепортация
		_val[1] = 20 
		_val[2] = _abil_map[? "state_value"]
		_val[3] = _abil_map[? "state_time"] - (_abil_map[? "state_cooldown"] * 0.25)
		_cur_rate += (_val[1] + _val[2] * _val[3]) * _val[0]
		sc_logging("Calc_rating", _a_name , "state teleport +", ((_val[1] + _val[2] * _val[3]) * _val[0]))
		break
	}
	case 29: {	// буст ближняя
		_val[1] = 3 
		_val[2] = _abil_map[? "state_value"] * 0.1
		_val[3] = _abil_map[? "state_time"] - (_abil_map[? "state_cooldown"] * 0.25)
		_cur_rate += (_val[1] + _val[2] * _val[3]) * _val[0]
		sc_logging("Calc_rating", _a_name , "state meleeup +", ((_val[1] + _val[2] * _val[3]) * _val[0]))
		break
	}
	case 30: {	// буст дальняя
		_val[1] = 4
		_val[2] = _abil_map[? "state_value"] * 0.1
		_val[3] = _abil_map[? "state_time"] - (_abil_map[? "state_cooldown"] * 0.25)
		_cur_rate += (_val[1] + _val[2] * _val[3]) * _val[0]
		sc_logging("Calc_rating", _a_name , "state rangeup +", ((_val[1] + _val[2] * _val[3]) * _val[0]))
		break
	}
	case 31: {	// лечение 1
		_val[1] = 15
		_val[2] = _abil_map[? "state_value"]
		_val[3] = _abil_map[? "state_time"] - (_abil_map[? "state_cooldown"] * 0.25)
		_cur_rate += (_val[1] + _val[2] * _val[3]) * _val[0]
		sc_logging("Calc_rating", _a_name , "state heal +", ((_val[1] + _val[2] * _val[3]) * _val[0]))
		break
	}
	case 32: {	// лечение 2
		_val[1] = 25
		_val[2] = _abil_map[? "state_value"]
		_val[3] = _abil_map[? "state_time"] - (_abil_map[? "state_cooldown"] * 0.25)
		_cur_rate += (_val[1] + _val[2] * _val[3]) * _val[0]
		sc_logging("Calc_rating", _a_name , "state cure +", ((_val[1] + _val[2] * _val[3]) * _val[0]))
		break
	}
	case 33: {	// лечение 3
		_val[1] = 40
		_val[2] = _abil_map[? "state_value"]
		_val[3] = _abil_map[? "state_time"] - (_abil_map[? "state_cooldown"] * 0.25)
		_cur_rate += (_val[1] + _val[2] * _val[3]) * _val[0]
		sc_logging("Calc_rating", _a_name , "state medicine +", ((_val[1] + _val[2] * _val[3]) * _val[0]))
		break
	}
	case 34: {	// снятие эффектов
		_val[1] = 30
		_val[2] = _abil_map[? "state_time"] - (_abil_map[? "state_cooldown"] * 0.25)
		_cur_rate += (_val[1] + _val[2]) * _val[0]
		sc_logging("Calc_rating", _a_name , "state clear +", ((_val[1] + _val[2]) * _val[0]))
		break
	}
	case 35: {	// уверенность
		_val[1] = 25
		_val[2] = _abil_map[? "state_value"]
		_val[3] = _abil_map[? "state_time"] - (_abil_map[? "state_cooldown"] * 0.25)
		_cur_rate += (_val[1] + _val[2]) * _val[0]
		sc_logging("Calc_rating", _a_name , "state confidance +", ((_val[1] + _val[2] * _val[3]) * _val[0]))
		break
	}
	case 36: {	// отражение
		_val[1] = 20
		_val[2] = _abil_map[? "state_time"] - (_abil_map[? "state_cooldown"] * 0.25)
		_cur_rate += (_val[1] + 3 * _val[2]) * _val[0]
		sc_logging("Calc_rating", _a_name , "state reflect +", ((_val[1] + 3 * _val[2]) * _val[0]))
		break
	}
	case 37: {	// поглощение
		_val[1] = 15
		_val[2] = _abil_map[? "state_value"] * 0.1
		_val[3] = _abil_map[? "state_time"] - (_abil_map[? "state_cooldown"] * 0.25)
		_cur_rate += (_val[1] + _val[2] * _val[3]) * _val[0]
		sc_logging("Calc_rating", _a_name , "state block +", ((_val[1] + _val[2] * _val[3]) * _val[0]))
		break
	}
	case 38: {	// ловкость
		_val[1] = 20
		_val[2] = _abil_map[? "state_value"] * 0.1
		_val[3] = _abil_map[? "state_time"] - (_abil_map[? "state_cooldown"] * 0.25)
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
		_val[2] = _abil_map[? "state_time"] - (_abil_map[? "state_cooldown"] * 0.25)
		_cur_rate += (_val[1] + _val[2]) * _val[0]
		sc_logging("Calc_rating", _a_name , "state wreak +", ((_val[1] + _val[2]) * _val[0]))
		break
	}
	case 41: {	// барьер
		_val[1] = 15 
		_val[2] = _abil_map[? "state_value"] * 0.15
		_val[3] = _abil_map[? "state_time"] - (_abil_map[? "state_cooldown"] * 0.25)
		_cur_rate += (_val[1] + _val[2] * _val[3]) * _val[0]
		sc_logging("Calc_rating", _a_name , "state barierre +", ((_val[1] + _val[2] * _val[3]) * _val[0]))
		break
	}
}
return _cur_rate
}	


