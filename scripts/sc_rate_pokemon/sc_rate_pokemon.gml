function sc_rate_pokemon(_pokemon_map) {
	//@ desc Calculate rating for pokemon
	///@arg pokemon_map

	var _cur_rate = 0
	var _ap = _pokemon_map[? "ap"]
	var _val = []
	var rate_survive = 0
	var rate_battle = 0
	sc_logging("Survive rating:")
	
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
	sc_logging("	", _p_name , "is " + size_text[_pokemon_map[? "size"]], _cur_rate)

	//==============================================================
	_val[0] = _pokemon_map[? "health"]
	_cur_rate += (_val[0] *0.1) * max(1, _s)

	//==============================================================
	if _pokemon_map[? "flyable"] > 0 {
		_cur_rate += 15
		sc_logging("	", _p_name , "is flyable", 15)
	}
	if _pokemon_map[? "digable"] > 0 {
		_cur_rate += 20
		sc_logging("	", _p_name , "is digable", 20)
	}
	
	_val[0] = 0; _s = undefined

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
		sc_logging("	", _p_name , "no first passive")
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
		sc_logging("	", _p_name , "no second passive")
	_val[0] = 0;_val[1] = 0; _val[2] = 0 

	rate_survive = _cur_rate
	sc_logging("Final rating", _p_name , "of survival", rate_survive)

	//==============================================================
	var _a_rate = 0
	var _dmg = 0
	var _lvl = 0
	var _frc = 0
	var abs_dmg = 0
	var _a_name = ds_map_find_first(_pokemon_map[? "actions"])
	var _temp_map = ds_map_create()
	var _count = 0
	sc_logging("Battle rating:")
	
	while not is_undefined(_a_name) {
		_count++
		ds_map_read(_temp_map, bini_sections[? "actions"][? _a_name])
			if not is_undefined(_temp_map[? "rating"])
				_a_rate += _temp_map[? "rating"]
			if not is_undefined(_temp_map[? "damage"])
				_dmg += _temp_map[? "damage"]
			if not is_undefined(_temp_map[? "level"])
				_lvl = _temp_map[? "level"]
			if not is_undefined(_temp_map[? "force"])
				_frc = _temp_map[? "force"]
			abs_dmg += sc_calculate_formula(3, _frc, _lvl, 50)
		_a_name = ds_map_find_next(_pokemon_map[? "actions"], _a_name)
	}
		
	ds_map_destroy(_temp_map)
	
	
	_val[0] = _dmg / _count
	_val[1] = _a_rate / _count
	_val[2] = _dmg / abs_dmg
	
	rate_battle = _val[0] * _val[2] + _val[1]
	
	sc_logging("	", _p_name , "average action damage", _val[0])
	sc_logging("	", _p_name , "average action rating", _val[1])
	sc_logging("Percentage ratio", undefined , "of possible damage", _val[2])
	sc_logging("Finat rating", _p_name, "of battle", rate_battle)
	
	_cur_rate += rate_battle

	_val[0] = 0; _val[1] = 0
	//==============================================================
	var pr_lvl = 1
	var _f = _pokemon_map[? "force"]
	if not is_undefined(_p_name) 
	if not is_undefined(p_stage[? _p_name]) 
		pr_lvl = (p_stage[? _p_name]) + 1

	_val[0] = _pokemon_map[? "health"]
	_val[1] = sc_calculate_formula(1, _f, pr_lvl, 0)
	_val[2] = _val[0] / _val[1] // percentage ratio of health
	sc_logging("Percentage ratio", undefined , "of health", _val[2])
	
	_cur_rate = _cur_rate * _val[2]

	_val[0] = 0; _val[1] = 0; _val[2] = 0

	//==============================================================

	sc_logging("Final rating", "of pokemon" , _p_name, _cur_rate)
	return _cur_rate
}


function sc_calc_rate_ability_state(_abil_map, _a_name, _dmg){
var _val = []
var _cur_rate = 0
var _mod_rate = 0
if is_undefined(_dmg) _dmg = 0

_val[0] = 0.25 * (_abil_map[? "state_rate"] + 1)
switch _abil_map[? "state"]{
	case 0: break;
	case 1: {	// горение
		_val[1] = 5
		_val[2] = _abil_map[? "state_value"]
		_val[3] = _abil_map[? "state_time"] - (_abil_map[? "state_cooldown"] * 0.25)
		_mod_rate = (_val[1] * _val[2] * _val[3]) * _val[0]
		_cur_rate += _mod_rate
		sc_logging("Rating of", _a_name , "state incineration", _mod_rate)
		break
	}
	case 2: {	// ожог
		_val[1] = 30
		_val[2] = _abil_map[? "state_time"] - (_abil_map[? "state_cooldown"] * 0.25)
		_mod_rate = (_val[1] * _val[2]) * _val[0]
		_cur_rate += _mod_rate
		sc_logging("Rating of", _a_name , "state scar", _mod_rate)
		break
	}
	case 3: {	// кровотечение
		_val[1] = 4
		_val[2] = _abil_map[? "state_value"]
		_val[3] = _abil_map[? "state_time"] - (_abil_map[? "state_cooldown"] * 0.25)
		_mod_rate = (_val[1] * _val[2] * _val[3]) * _val[0]
		_cur_rate += _mod_rate
		sc_logging("Rating of", _a_name , "state bleeding", _mod_rate)
		break
	}
	case 4: {	// пиявка
		_val[1] = 5
		_val[2] = _abil_map[? "state_value"]
		_val[3] = _abil_map[? "state_time"] - (_abil_map[? "state_cooldown"] * 0.25)
		_mod_rate = (_val[1] * _val[2] * _val[3]) * _val[0]
		_cur_rate += _mod_rate
		sc_logging("Rating of", _a_name , "state leech", _mod_rate)
		break
	}
	case 5: {	// отравление
		_val[1] = 6
		_val[2] = _abil_map[? "state_value"]
		_val[3] = _abil_map[? "state_time"] - (_abil_map[? "state_cooldown"] * 0.25)
		_mod_rate = (_val[1] * _val[2] * _val[3]) * _val[0]
		_cur_rate += _mod_rate
		sc_logging("Rating of", _a_name , "state infestation", _mod_rate)
		break
	}
	case 6: {	// парализация
		_val[1] = 15
		_val[2] = _abil_map[? "state_time"] - (_abil_map[? "state_cooldown"] * 0.25)
		_mod_rate = (_val[1] * _val[2]) * _val[0]
		_cur_rate += _mod_rate
		sc_logging("Rating of", _a_name , "state paralyze", _mod_rate)
		break
	}
	case 7: {	// +1 к атаке
		_val[1] = 4.3
		_val[2] = _abil_map[? "state_value"] * 0.1
		_val[3] = _abil_map[? "state_time"] - (_abil_map[? "state_cooldown"] * 0.25)
		_mod_rate = (_val[1] * _val[2] * _val[3]) * _val[0]
		_cur_rate += _mod_rate
		sc_logging("Rating of", _a_name , "state gain damage", _mod_rate)
		break
	}
	case 8: {	// слабость
		_val[1] = 5
		_val[2] = _abil_map[? "state_value"] * 0.1
		_val[3] = _abil_map[? "state_time"] - (_abil_map[? "state_cooldown"] * 0.25)
		_mod_rate = (_val[1] * _val[2] * _val[3]) * _val[0]
		_cur_rate += _mod_rate
		sc_logging("Rating of", _a_name , "state weak", _mod_rate)
		break
	}
	case 9: {	// +1 к ОД
		_val[1] = 10
		_val[2] = _abil_map[? "state_value"]
		_val[3] = _abil_map[? "state_time"] - (_abil_map[? "state_cooldown"] * 0.25)
		_mod_rate = (_val[1] * _val[2] * _val[3]) * _val[0]
		_cur_rate += _mod_rate
		sc_logging("Rating of", _a_name , "state gain speed", _mod_rate)
		break
	}
	case 10: {	// замедление
		_val[1] = 15
		_val[2] = _abil_map[? "state_value"]
		_val[3] = _abil_map[? "state_time"] - (_abil_map[? "state_cooldown"] * 0.25)
		_mod_rate = (_val[1] * _val[2] * _val[3]) * _val[0]
		_cur_rate += _mod_rate
		sc_logging("Rating of", _a_name , "state slowdown", _mod_rate)
		break
	}
	case 11: {	// ловушка
		_val[1] = 7
		_val[2] = _abil_map[? "state_value"]
		_val[3] = _abil_map[? "state_time"] - (_abil_map[? "state_cooldown"] * 0.25)
		_mod_rate = (_val[1] + _val[2] + (7 * _val[3])) * _val[0]
		_cur_rate += _mod_rate
		sc_logging("Rating of", _a_name , "state trap", _mod_rate)
		break
	}
	case 12: {	// случайный урон
		_val[1] = _abil_map[? "state_value"]
		_val[2] = _dmg * 0.2
		switch _val[1] {
			case 0: {
				_mod_rate = _val[2] * 0.5 *_val[0]
				_cur_rate += _mod_rate
				sc_logging("Rating of", _a_name , "state random damage0", _mod_rate)
				break
			}
			case 1: {
				_mod_rate = _val[2] *_val[0]
				_cur_rate += _mod_rate
				sc_logging("Rating of", _a_name , "state random damage1", _mod_rate)
				break
			}
			case 2: {
				_mod_rate = _val[2] * 1.5 *_val[0]
				_cur_rate += _mod_rate
				sc_logging("Rating of", _a_name , "state random damage2", _mod_rate)
				break
			}
			case 3: {
				_mod_rate = _val[2]* 2 *_val[0]
				_cur_rate += _mod_rate
				sc_logging("Rating of", _a_name , "state random damage3", _mod_rate)
				break
			}
		}
		break
	}
	case 13: {	// усыпление
		_val[1] = 4.6
		_val[2] = _abil_map[? "state_time"] - (_abil_map[? "state_cooldown"] * 0.25)
		_mod_rate = (_val[1] * _val[2]) * _val[0]
		_cur_rate += _mod_rate
		sc_logging("Rating of", _a_name , "state lulling", _mod_rate)
		break
	}
	case 14: {	// ошеломление
		_val[1] = 9.7
		_val[2] = _abil_map[? "state_time"] - (_abil_map[? "state_cooldown"] * 0.25)
		_mod_rate = (_val[1] * _val[2]) * _val[0]
		_cur_rate += _mod_rate
		sc_logging("Rating of", _a_name , "state stun", _mod_rate)
		break
	}
	case 15: {	// ужас
		_val[1] = 9.3
		_val[2] = _abil_map[? "state_time"] - (_abil_map[? "state_cooldown"] * 0.25)
		_mod_rate = (_val[1] * _val[2]) * _val[0]
		_cur_rate += _mod_rate
		sc_logging("Rating of", _a_name , "state fear", _mod_rate)
		break
	}
	case 16: {	// побег
		_val[1] = 8
		_val[2] = _abil_map[? "state_time"] - (_abil_map[? "state_cooldown"] * 0.25)
		_mod_rate = (_val[1] * _val[2]) * _val[0]
		_cur_rate += _mod_rate
		sc_logging("Rating of", _a_name , "state escape", _mod_rate)
		break
	}
	case 17: {	// пропуск хода
		_val[1] = 10
		_val[2] = _abil_map[? "state_time"] - (_abil_map[? "state_cooldown"] * 0.25)
		_mod_rate = (_val[1] * _val[2]) * _val[0]
		_cur_rate += _mod_rate
		sc_logging("Rating of", _a_name , "state waste time", _mod_rate)
		break
	}
	case 18: {	// отвращение
		_val[1] = 8
		_val[2] = _abil_map[? "state_time"] - (_abil_map[? "state_cooldown"] * 0.25)
		_mod_rate = (_val[1] * _val[2]) * _val[0]
		_cur_rate += _mod_rate
		sc_logging("Rating of", _a_name , "state disgust", _mod_rate)
		break
	}
	case 19: {	// прицел
		_val[1] = 7.2 
		_val[2] = _abil_map[? "state_value"] * 0.1
		_val[3] = _abil_map[? "state_time"] - (_abil_map[? "state_cooldown"] * 0.25)
		_mod_rate = (_val[1] * _val[2] * _val[3]) * _val[0]
		_cur_rate += _mod_rate
		sc_logging("Rating of", _a_name , "state target", _mod_rate)
		break
	}
	case 20: {	// неуклюжесть
		_val[1] = 7.3
		_val[2] = _abil_map[? "state_value"] * 0.1
		_val[3] = _abil_map[? "state_time"] - (_abil_map[? "state_cooldown"] * 0.25)
		_mod_rate = (_val[1] * _val[2] * _val[3]) * _val[0]
		_cur_rate += _mod_rate
		sc_logging("Rating of", _a_name , "state loser", _mod_rate)
		break
	}
	case 21: {	// отбрасывание
		_val[1] = 4
		_val[2] = _abil_map[? "state_time"] - (_abil_map[? "state_cooldown"] * 0.25)
		_mod_rate = (_val[1] * _val[2]) * _val[0]
		_cur_rate += _mod_rate
		sc_logging("Rating of", _a_name , "state knockback", _mod_rate)
		break
	}
	case 22: {	// взрыв
		_val[1] = 10
		_val[2] = _abil_map[? "state_value"] * 0.2
		_val[3] = _abil_map[? "state_time"] - (_abil_map[? "state_cooldown"] * 0.25)
		_mod_rate = ((_val[1] + _val[2]) * _val[3]) * _val[0]
		_cur_rate += _mod_rate
		sc_logging("Rating of", _a_name , "state explode", _mod_rate)
		break
	}
	case 23: {	// месть
		_val[1] = 7
		_val[2] = _abil_map[? "state_time"] - (_abil_map[? "state_cooldown"] * 0.25)
		_mod_rate = (_val[1] * _val[2]) * _val[0]
		_cur_rate += _mod_rate
		sc_logging("Rating of", _a_name , "state revenge" , _mod_rate)
		break
	}
	case 24: {	// камикадзе
		_val[1] = -20
		_val[2] = _abil_map[? "state_time"]
		_mod_rate = (_val[1] - _val[2]) * _val[0]
		_cur_rate += _mod_rate
		sc_logging("Rating of", _a_name , "state kamikaze" , _mod_rate)
		break
	}
	case 25: {	// гипноз
		_val[1] = 16
		_val[2] = _abil_map[? "state_time"] - (_abil_map[? "state_cooldown"] * 0.25)
		_cur_rate += _val[1] * _val[2] * _val[0]
		_cur_rate += _mod_rate
		sc_logging("Rating of", _a_name , "state Hypnotize", _mod_rate)
		break
	}
	case 26: {	// смущение
		_val[1] = 9.5
		_val[2] = _abil_map[? "state_value"] * 0.1
		_val[3] = _abil_map[? "state_time"] - (_abil_map[? "state_cooldown"] * 0.25)
		_mod_rate = (_val[1] * _val[2] * _val[3]) * _val[0]
		_cur_rate += _mod_rate
		sc_logging("Rating of", _a_name , "state confusion", _mod_rate)
		break
	}
	case 27: {	// телекинез
		_val[1] = 30
		_val[2] = 50 / _abil_map[? "state_value"]
		_val[3] = _abil_map[? "state_time"] - (_abil_map[? "state_cooldown"] * 0.25)
		_mod_rate = (_val[1] + _val[2] * _val[3]) * _val[0]
		_cur_rate += _mod_rate
		sc_logging("Rating of", _a_name , "state telekinetic", _mod_rate)
		break
	}
	case 28: {	// телепортация
		_val[1] = 40
		_val[2] = 50 /_abil_map[? "state_value"]
		_val[3] = _abil_map[? "state_time"] - (_abil_map[? "state_cooldown"] * 0.25)
		_mod_rate = (_val[1] + _val[2] * _val[3]) * _val[0]
		_cur_rate += _mod_rate
		sc_logging("Rating of", _a_name , "state teleport", _mod_rate)
		break
	}
	case 29: {	// буст ближняя
		_val[1] = 3.8
		_val[2] = _abil_map[? "state_value"] * 0.1
		_val[3] = _abil_map[? "state_time"] - (_abil_map[? "state_cooldown"] * 0.25)
		_mod_rate = (_val[1] * _val[2] * _val[3]) * _val[0]
		_cur_rate += _mod_rate
		sc_logging("Rating of", _a_name , "state meleeup", _mod_rate)
		break
	}
	case 30: {	// буст дальняя
		_val[1] = 4.1
		_val[2] = _abil_map[? "state_value"] * 0.1
		_val[3] = _abil_map[? "state_time"] - (_abil_map[? "state_cooldown"] * 0.25)
		_mod_rate = (_val[1] * _val[2] * _val[3]) * _val[0]
		_cur_rate += _mod_rate
		sc_logging("Rating of", _a_name , "state rangeup", _mod_rate)
		break
	}
	case 31: {	// лечение 1
		_val[1] = 2
		_val[2] = _abil_map[? "state_value"]
		_val[3] = _abil_map[? "state_time"] - (_abil_map[? "state_cooldown"] * 0.25)
		_mod_rate = (_val[1] * _val[2] * _val[3]) * _val[0]
		_cur_rate += _mod_rate
		sc_logging("Rating of", _a_name , "state heal", _mod_rate)
		break
	}
	case 32: {	// лечение 2
		_val[1] = 3
		_val[2] = _abil_map[? "state_value"]
		_val[3] = _abil_map[? "state_time"] - (_abil_map[? "state_cooldown"] * 0.25)
		_mod_rate = (_val[1] * _val[2] * _val[3]) * _val[0]
		_cur_rate += _mod_rate
		sc_logging("Rating of", _a_name , "state cure", _mod_rate)
		break
	}
	case 33: {	// лечение 3
		_val[1] = 4
		_val[2] = _abil_map[? "state_value"]
		_val[3] = _abil_map[? "state_time"] - (_abil_map[? "state_cooldown"] * 0.25)
		_mod_rate = (_val[1] * _val[2] * _val[3]) * _val[0]
		_cur_rate += _mod_rate
		sc_logging("Rating of", _a_name , "state medicine", _mod_rate)
		break
	}
	case 34: {	// снятие эффектов
		_val[1] = 4
		_val[2] = _abil_map[? "state_time"] - (_abil_map[? "state_cooldown"] * 0.25)
		_mod_rate = (_val[1] * _val[2]) * _val[0]
		_cur_rate += _mod_rate
		sc_logging("Rating of", _a_name , "state clear", _mod_rate)
		break
	}
	case 35: {	// уверенность
		_val[1] = 3
		_val[2] = _abil_map[? "state_value"]
		_val[3] = _abil_map[? "state_time"] - (_abil_map[? "state_cooldown"] * 0.25)
		_mod_rate = (_val[1] * _val[2]) * _val[0]
		_cur_rate += _mod_rate
		sc_logging("Rating of", _a_name , "state confidance", _mod_rate)
		break
	}
	case 36: {	// отражение
		_val[1] = 17
		_val[2] = _abil_map[? "state_time"] - (_abil_map[? "state_cooldown"] * 0.25)
		_mod_rate = (_val[1] * _val[2]) * _val[0]
		_cur_rate += _mod_rate
		sc_logging("Rating of", _a_name , "state reflect", _mod_rate)
		break
	}
	case 37: {	// поглощение
		_val[1] = 5
		_val[2] = _abil_map[? "state_value"] * 0.1
		_val[3] = _abil_map[? "state_time"] - (_abil_map[? "state_cooldown"] * 0.25)
		_mod_rate = (_val[1] * _val[2] * _val[3]) * _val[0]
		_cur_rate += _mod_rate
		sc_logging("Rating of", _a_name , "state block", _mod_rate)
		break
	}
	case 38: {	// ловкость
		_val[1] = 7.8
		_val[2] = _abil_map[? "state_value"] * 0.1
		_val[3] = _abil_map[? "state_time"] - (_abil_map[? "state_cooldown"] * 0.25)
		_mod_rate = (_val[1] * _val[2] * _val[3]) * _val[0]
		_cur_rate += _mod_rate
		sc_logging("Rating of", _a_name , "state dextery", _mod_rate)
		break
	}
	case 39: {	// обоюдный урон
		_val[1] = 5
		_val[2] = _abil_map[? "state_value"] * 0.1
		_mod_rate -= (_val[1] * _val[2]) * (1 - _val[0])
		_cur_rate += _mod_rate
		sc_logging("Rating of", _a_name , "state desperate -",_mod_rate)
		break
	}
	case 40: {	// трещина
		_val[1] = 25
		_val[2] = _abil_map[? "state_time"] - (_abil_map[? "state_cooldown"] * 0.25)
		_mod_rate = (_val[1] * _val[2]) * _val[0]
		_cur_rate += _mod_rate
		sc_logging("Rating of", _a_name , "state wreak", _mod_rate)
		break
	}
	case 41: {	// барьер
		_val[1] = 1.4
		_val[2] = _abil_map[? "state_value"] * 0.1
		_val[3] = _abil_map[? "state_time"] - (_abil_map[? "state_cooldown"] * 0.25)
		_mod_rate = (_val[1] * _val[2] * _val[3]) * _val[0]
		_cur_rate += _mod_rate
		sc_logging("Rating of", _a_name , "state barierre", _mod_rate)
		break
	}
}
return _cur_rate
}	


