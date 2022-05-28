function sc_rate_pokemon(_pokemon_map) {
	//@ desc Calculate rating for pokemon
	///@arg pokemon_map

	var _cur_rate = 0
	var _ap = _pokemon_map[? "ap"]
	var _val = []
	var rate_survive = 0
	var rate_battle = 0
	var mod_rate = 0
	
	if is_undefined(_pokemon_map[? "title"]) or 
	_pokemon_map[? "title"] == ""
		return _cur_rate
	
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
	var _p_name = _pokemon_map[? "title"]
	sc_logging ("Calculate raiting for", _p_name, ":", undefined)
	sc_logging("-----------------------------------------------------", undefined, undefined, undefined)
	sc_logging("Survive rating:", undefined, undefined, undefined)

	var _s
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
	mod_rate = (_val[0] *0.1) * max(1, _s)
	
	//==============================================================
	if _pokemon_map[? "flyable"] > 0 {
		mod_rate += 15
		sc_logging("	", _p_name , "is flyable", 15)
	}
	if _pokemon_map[? "digable"] > 0 {
		mod_rate += 20
		sc_logging("	", _p_name , "is digable", 20)
	}
	
	sc_logging("	", "survive rating" , "(clear)", mod_rate)
	_cur_rate += mod_rate
	_val[0] = 0; _s = undefined; mod_rate =0

	//==============================================================
	if not is_undefined(_pass_abil1) and _pokemon_map[? "passive_1"] != "" {
		_val[0] = _pass_abil1[? "in_health_sign"]
		_val[1] = _pass_abil1[? "marker_health"]
		if _val[0] != 0
			_val[2] = (100 - _val[1]) * 0.01
		else
			_val[2] = _val[1] * 0.01
		_cur_rate += _val[2] * sc_calc_rate_ability_state(_pass_abil1, _p_name, _ATTACK_ROLE.buff, 0)
	} else 
		sc_logging("	", _p_name , "no first passive", undefined)
	_val[0] = 0;_val[1] = 0; _val[2] = 0 

	if not is_undefined(_pass_abil2) and _pokemon_map[? "passive_2"] != "" {
		_val[0] = _pass_abil2[? "in_health_sign"]
		_val[1] = _pass_abil2[? "marker_health"]
		if _val[0] != 0
			_val[2] = (100 - _val[1]) * 0.01
		else
			_val[2] = _val[1] * 0.01
		_cur_rate += _val[2] * sc_calc_rate_ability_state(_pass_abil2, _p_name, _ATTACK_ROLE.buff, 0)
	} else 
		sc_logging("	", _p_name , "no second passive", undefined)
	_val[0] = 0;_val[1] = 0; _val[2] = 0 

	rate_survive = _cur_rate
	sc_logging("Final rating", _p_name , "of survival", rate_survive)
	sc_logging("-----------------------------------------------------", undefined, undefined, undefined)

	//==============================================================
	var _a_rate = 0
	var _dmg = 0
	var _lvl = 0
	var _ap = 0
	var abs_dmg = 0
	var _a_name = ds_map_find_first(_pokemon_map[? "actions"])
	var _temp_map = ds_map_create()
	var _count = 0
	sc_logging("Battle rating:", undefined, undefined, undefined)
	
	while not is_undefined(_a_name) {
		_count++
		ds_map_read(_temp_map, bini_sections[? "actions"][? _a_name])
			if not is_undefined(_temp_map[? "rating"])
				_a_rate += _temp_map[? "rating"]
			if not is_undefined(_temp_map[? "damage"])
				_dmg += _temp_map[? "damage"]
			if not is_undefined(_temp_map[? "level"])
				_lvl = _temp_map[? "level"]
			if not is_undefined(_temp_map[? "ap"])
				_ap = _temp_map[? "ap"]
			abs_dmg += sc_calculate_formula(3, _FORCE.elite, _lvl, _ap)
		_a_name = ds_map_find_next(_pokemon_map[? "actions"], _a_name)
	}
		
	ds_map_destroy(_temp_map)
	
	
	_val[0] = _dmg / _count
	_val[1] = _a_rate / _count
	_val[2] = _dmg / abs_dmg
	
	rate_battle = _val[0] * _val[2] + _val[1]
	
	sc_logging("	","Action count:", _count, undefined)
	sc_logging("	", _p_name , "action damage average value", _val[0])
	sc_logging("	", _p_name , "action rating average value", _val[1])
	sc_logging("	", "ideal damage average value", undefined, (abs_dmg / _count))
	sc_logging("	", "Difference of real/ideal damage", string(_val[2]* 100) + "%", undefined)
	sc_logging("Finat rating", _p_name, "of battle", rate_battle)
	sc_logging("-----------------------------------------------------", undefined, undefined, undefined)
	
	_cur_rate += rate_battle

	_val[0] = 0; _val[1] = 0
	//==============================================================
	var pr_lvl = 1
	if not is_undefined(_p_name) 
	if not is_undefined(p_stage[? _p_name]) 
		pr_lvl = (p_stage[? _p_name]) + 1
	if not is_undefined(_pokemon_map[? "health"])
		_val[0] = _pokemon_map[? "health"]
		
	_val[1] = sc_calculate_formula(1, _FORCE.elite, pr_lvl, undefined)
	_val[2] = _val[0] / _val[1] // percentage ratio of health
	sc_logging("Custom health value", _val[0], undefined, undefined)
	sc_logging("Ideal health value", "(Elite)",_val[1], undefined)
	sc_logging("Difference of custon/elite health", string(_val[2] * 100) + "%", undefined, undefined)
	
	_cur_rate = _cur_rate * _val[2]

	_val[0] = 0; _val[1] = 0; _val[2] = 0
	//==============================================================
	switch _pokemon_map[? "habitat"] {
		case _HABITAT._all:
			sc_logging(_p_name, "has habitat everywhere.", undefined, undefined)
			break;
		case _HABITAT._ground:
			sc_logging(_p_name, "has habitat only on ground.", "Rating decrease on 15%", undefined)
			_cur_rate *= 0.85
			break;
		case _HABITAT._water:
			sc_logging(_p_name, "has habitat only on water.", "Rating decrease on 30%", undefined)
			_cur_rate *= 0.7
			break;
	}
	
	sc_logging("-----------------------------------------------------", undefined, undefined, undefined)
	sc_logging("Final rating", "of pokemon" , _p_name, _cur_rate)
	return _cur_rate
}
//=====================================================================================================




//=====================================================================================================

function sc_calc_rate_ability_state(_abil_map, _a_name, is_buff, _dmg){
var _val = []
var _cur_rate = 0
var _mod_rate = 0
if is_undefined(_dmg) 
	_dmg = 0
if _a_name = undefined
	_a_name = "free state"
	
var _role = -1 // is the Debuff
if is_buff = _ATTACK_ROLE.buff
	_role = 1 // is the Buff


_val[0] = 0.25 * (_abil_map[? "state_rate"] + 1)
switch _abil_map[? "state"]{
	case 0: break;
	case 1: {	// горение
		_val[1] = 2.25
		_val[2] = _abil_map[? "state_value"]
		_val[3] = _abil_map[? "state_time"] - (_abil_map[? "state_cooldown"] * 0.25)
		_mod_rate = -(_val[1] * _val[2] * _val[3]) * _val[0]
		sc_logging("Rating of", _a_name , "state Incineration", (_mod_rate * _role))
		sc_logging("Cost state Incineration", string(_val[1]), undefined, undefined)
		sc_logging("Value per sec", string(_val[2]), "fire damage", undefined)
		sc_logging("Cost for difference of lifetime/cooldown", string(_val[3]), undefined, undefined)
		break
	}
	case 2: {	// ожог
		_val[1] = 16
		_val[2] = _abil_map[? "state_time"] - (_abil_map[? "state_cooldown"] * 0.25)
		_mod_rate = -(_val[1] * _val[2]) * _val[0]
		sc_logging("Rating of", _a_name , "state Scar", (_mod_rate * _role))
		sc_logging("Cost state Scar", string(_val[1]), undefined, undefined)
		sc_logging("Cost for difference of lifetime/cooldown", string(_val[2]), undefined, undefined)
		break
	}
	case 3: {	// кровотечение
		_val[1] = 3.55
		_val[2] = _abil_map[? "state_value"]
		_val[3] = _abil_map[? "state_time"] - (_abil_map[? "state_cooldown"] * 0.25)
		_mod_rate = -(_val[1] * _val[2] * _val[3]) * _val[0]
		sc_logging("Rating of", _a_name , "state Bleeding", (_mod_rate * _role))
		sc_logging("Cost state Bleeding", string(_val[1]), undefined, undefined)
		sc_logging("Value per sec", string(_val[2]), "flash damage", undefined)
		sc_logging("Cost for difference of lifetime/cooldown", string(_val[3]), undefined, undefined)
		break
	}
	case 4: {	// пиявка
		_val[1] = 6.25
		_val[2] = _abil_map[? "state_value"]
		_val[3] = _abil_map[? "state_time"] - (_abil_map[? "state_cooldown"] * 0.25)
		_mod_rate = -(_val[1] * _val[2] * _val[3]) * _val[0]
		sc_logging("Rating of", _a_name , "state Leech life", (_mod_rate * _role))
		sc_logging("Cost state Leech life", string(_val[1]), undefined, undefined)
		sc_logging("Value per sec", string(_val[2]), "flash damage", undefined)
		sc_logging("Cost for difference of lifetime/cooldown", string(_val[3]), undefined, undefined)
		break
	}
	case 5: {	// отравление
		_val[1] = 2
		_val[2] = _abil_map[? "state_value"]
		_val[3] = _abil_map[? "state_time"] - (_abil_map[? "state_cooldown"] * 0.25)
		_mod_rate = -(_val[1] * _val[2] * _val[3]) * _val[0]
		sc_logging("Rating of", _a_name , "state Infestation", (_mod_rate * _role))
		sc_logging("Cost state Infestation", string(_val[1]), undefined, undefined)
		sc_logging("Value per sec", string(_val[2]), "poison damage", undefined)
		sc_logging("Cost for difference of lifetime/cooldown", string(_val[3]), undefined, undefined)
		break
	}
	case 6: {	// парализация
		_val[1] = 8
		_val[2] = _abil_map[? "state_time"] - (_abil_map[? "state_cooldown"] * 0.25)
		_mod_rate = -(_val[1] * _val[2]) * _val[0]
		sc_logging("Rating of", _a_name , "state Paralyze", (_mod_rate * _role))
		sc_logging("Cost state Paralyze", string(_val[1]), undefined, undefined)
		sc_logging("Cost for difference of lifetime/cooldown", string(_val[2]), undefined, undefined)
		break
	}
	case 7: {	// +1 к атаке
		_val[1] = 3.35
		_val[2] = _abil_map[? "state_value"]
		_val[3] = (_abil_map[? "state_time"] - (_abil_map[? "state_cooldown"] * 0.25)) / 5
		_mod_rate = (_val[1] * _val[2] * _val[3]) * _val[0] * 0.1
		sc_logging("Rating of", _a_name , "state Gain damage", (_mod_rate * _role))
		sc_logging("Cost state Gain damage", string(_val[1]), undefined, undefined)
		sc_logging("Value", string(_val[2])+"%", "gain damage", undefined)
		sc_logging("Cost for difference of lifetime/cooldown", string(_val[3]), undefined, undefined)
		break
	}
	case 8: {	// слабость
		_val[1] = 3.35
		_val[2] = _abil_map[? "state_value"]
		_val[3] = (_abil_map[? "state_time"] - (_abil_map[? "state_cooldown"] * 0.25)) / 5
		_mod_rate = -(_val[1] * _val[2] * _val[3]) * _val[0] * 0.1
		sc_logging("Rating of", _a_name , "state Weak", (_mod_rate * _role))
		sc_logging("Cost state Weak", string(_val[1]), undefined, undefined)
		sc_logging("Value", string(_val[2])+"%", "decrease damage", undefined)
		sc_logging("Cost for difference of lifetime/cooldown", string(_val[3]), undefined, undefined)
		break
	}
	case 9: {	// +1 к ОД
		_val[1] = 5
		_val[2] = _abil_map[? "state_value"]
		_val[3] = _abil_map[? "state_time"] - (_abil_map[? "state_cooldown"] * 0.25)
		_mod_rate = (_val[1] * _val[2] * _val[3]) * _val[0]
		sc_logging("Rating of", _a_name , "state Gain speed", (_mod_rate * _role))
		sc_logging("Cost state Gain speed", string(_val[1]), undefined, undefined)
		sc_logging("Value", string(_val[2]), "speed up", undefined)
		sc_logging("Cost for difference of lifetime/cooldown", string(_val[3]), undefined, undefined)
		break
	}
	case 10: {	// замедление
		_val[1] = 5
		_val[2] = _abil_map[? "state_value"]
		_val[3] = _abil_map[? "state_time"] - (_abil_map[? "state_cooldown"] * 0.25)
		_mod_rate = -(_val[1] * _val[2] * _val[3]) * _val[0]
		sc_logging("Rating of", _a_name , "state Slowdown", (_mod_rate * _role))
		sc_logging("Cost state Slowdown", string(_val[1]), undefined, undefined)
		sc_logging("Value", string(_val[2]), "slowdown speed", undefined)
		sc_logging("Cost for difference of lifetime/cooldown", string(_val[3]), undefined, undefined)
		break
	}
	case 11: {	// ловушка
		_val[1] = 10.5
		_val[2] = _abil_map[? "state_value"]
		_val[3] = _abil_map[? "state_time"] - (_abil_map[? "state_cooldown"] * 0.25)
		_mod_rate = -(_val[1] * _val[3] + _val[2]) * _val[0]
		sc_logging("Rating of", _a_name , "state Trap", (_mod_rate * _role))
		sc_logging("Cost state Trap", string(_val[1]), undefined, undefined)
		sc_logging("Value damage", string(_val[2]), "at once", undefined)
		sc_logging("Cost for difference of lifetime/cooldown", string(_val[3]), undefined, undefined)
		break
	}
	case 12: {	// случайный урон
		_val[1] = _abil_map[? "state_value"]
		_val[2] = _dmg // * 0.1
		switch _val[1] {
			case 0: {
				_mod_rate = -_val[2] * 0.5 *_val[0]
				sc_logging("Rating of", _a_name , "state random damage *0.5", (_mod_rate * _role))
				break
			}
			case 1: {
				_mod_rate = -_val[2] *_val[0]
				sc_logging("Rating of", _a_name , "state random damage * 1", (_mod_rate * _role))
				break
			}
			case 2: {
				_mod_rate = -_val[2] * 1.5 *_val[0]
				sc_logging("Rating of", _a_name , "state random damage * 2", (_mod_rate * _role))
				break
			}
			case 3: {
				_mod_rate = -_val[2]* 2 *_val[0]
				sc_logging("Rating of", _a_name , "state random damage * 3", (_mod_rate * _role))
				break
			}
		}
		sc_logging("Cost state Random damage = 0", undefined, undefined, undefined)
		sc_logging("Value damage", string(_val[2]), "at once", undefined)
		break
	}
	case 13: {	// усыпление
		_val[1] = 6
		_val[2] = _abil_map[? "state_time"] - (_abil_map[? "state_cooldown"] * 0.25)
		_mod_rate = -(_val[1] * _val[2]) * _val[0]
		sc_logging("Rating of", _a_name , "state Lulling", (_mod_rate * _role))
		sc_logging("Cost state Lulling", string(_val[1]), undefined, undefined)
		sc_logging("Cost for difference of lifetime/cooldown", string(_val[2]), undefined, undefined)
		break
	}
	case 14: {	// ошеломление
		_val[1] = 4
		_val[2] = (_abil_map[? "state_time"] - (_abil_map[? "state_cooldown"] * 0.25)) / 2
		_mod_rate = -(_val[1] * _val[2]) * _val[0]
		sc_logging("Rating of", _a_name , "state Stun", (_mod_rate * _role))
		sc_logging("Cost state Stun", string(_val[1]), undefined, undefined)
		sc_logging("Cost for difference of lifetime/cooldown", string(_val[2]), undefined, undefined)
		break
	}
	case 15: {	// ужас
		_val[1] = 3
		_val[2] = (_abil_map[? "state_time"] - (_abil_map[? "state_cooldown"] * 0.25)) / 5
		_mod_rate = -(_val[1] * _val[2]) * _val[0]
		sc_logging("Rating of", _a_name , "state Fear", (_mod_rate * _role))
		sc_logging("Cost state Fear", string(_val[1]), undefined, undefined)
		sc_logging("Cost for difference of lifetime/cooldown", string(_val[2]), undefined, undefined)
		break
	}
	case 16: {	// побег
		_val[1] = 7
		_val[2] = _abil_map[? "state_time"] - (_abil_map[? "state_cooldown"] * 0.25)
		_mod_rate = -(_val[1] * _val[2]) * _val[0]
		sc_logging("Rating of", _a_name , "state Escape", (_mod_rate * _role))
		sc_logging("Cost state Escape", string(_val[1]), undefined, undefined)
		sc_logging("Cost for difference of lifetime/cooldown", string(_val[2]), undefined, undefined)
		break
	}
	case 17: {	// безделье
		_val[1] = 9
		_val[2] = _abil_map[? "state_time"] - (_abil_map[? "state_cooldown"] * 0.25)
		_mod_rate = -(_val[1] * _val[2]) * _val[0]
		sc_logging("Rating of", _a_name , "state Waste time", (_mod_rate * _role))
		sc_logging("Cost state Waste time", string(_val[1]), undefined, undefined)
		sc_logging("Cost for difference of lifetime/cooldown", string(_val[2]), undefined, undefined)
		break
	}
	case 18: {	// отвратительный
		_val[1] = 2
		_val[2] = (_abil_map[? "state_time"] - (_abil_map[? "state_cooldown"] * 0.25)) / 5
		_mod_rate = (_val[1] * _val[2]) * _val[0]
		sc_logging("Rating of", _a_name , "state Disgust", (_mod_rate * _role))
		sc_logging("Cost state Disgust", string(_val[1]), undefined, undefined)
		sc_logging("Cost for difference of lifetime/cooldown", string(_val[2]), undefined, undefined)
		break
	}
	case 19: {	// прицел
		_val[1] = 1.65
		_val[2] = _abil_map[? "state_value"]
		_val[3] = (_abil_map[? "state_time"] - (_abil_map[? "state_cooldown"] * 0.25)) / 5
		_mod_rate = (_val[1] * _val[2] * _val[3]) * _val[0] * 0.1
		sc_logging("Rating of", _a_name , "state Target", (_mod_rate * _role))
		sc_logging("Cost state Target", string(_val[1]), undefined, undefined)
		sc_logging("Value", string(_val[2]) + "%", "gain accuracy", undefined)
		sc_logging("Cost for difference of lifetime/cooldown", string(_val[3]), undefined, undefined)
		break
	}
	case 20: {	// неуклюжесть
		_val[1] = 1.2
		_val[2] = _abil_map[? "state_value"]
		_val[3] = (_abil_map[? "state_time"] - (_abil_map[? "state_cooldown"] * 0.25)) / 5
		_mod_rate = -(_val[1] * _val[2] * _val[3]) * _val[0] * 0.1
		sc_logging("Rating of", _a_name , "state Loser", (_mod_rate * _role))
		sc_logging("Cost state Loser", string(_val[1]), undefined, undefined)
		sc_logging("Value", string(_val[2]) + "%", "degrease dodge", undefined)
		sc_logging("Cost for difference of lifetime/cooldown", string(_val[3]), undefined, undefined)
		break
	}
	case 21: {	// отбрасывание
		_val[1] = 20
		_val[2] = _abil_map[? "state_time"]
		_mod_rate = -(_val[1] * _val[2]) * _val[0]
		sc_logging("Rating of", _a_name , "state Knock back", (_mod_rate * _role))
		sc_logging("Cost state Knock back", string(_val[1]), undefined, undefined)
		sc_logging("Value distance of knock", string(_val[2]), undefined, undefined)
		break
	}
	case 22: {	// взрыв
		_val[1] = 0.5
		_val[2] = _abil_map[? "state_value"] - 10 * _abil_map[? "state_cooldown"]
		_val[3] = _abil_map[? "state_time"]
		_mod_rate = -((_val[1] + _val[2]) * _val[3]) * _val[0]
		sc_logging("Rating of", _a_name , "state Explode", (_mod_rate * _role))
		sc_logging("Cost state Explode", string(_val[1]), undefined, undefined)
		sc_logging("Value damage", string(_val[2]), "at area", undefined)
		sc_logging("Radius of damage area", string(_val[3]), undefined, undefined)
		break
	}
	case 23: {	// месть
		_val[1] = 75
		_val[2] = _abil_map[? "state_time"] - (_abil_map[? "state_cooldown"] * 0.25)
		_val[3] = (_val[1] * _val[2]) * _val[0]
		_cur_rate += _val[3] // не зависит от роли атаки "buff"
		sc_logging("Rating of", _a_name , "state Revenge" , _val[3])
		sc_logging("Cost state Revenge", string(_val[1]), undefined, undefined)
		sc_logging("Cost for difference of lifetime/cooldown", string(_val[2]), undefined, undefined)
				break
	}
	case 24: {	// камикадзе
		_val[1] = 150
		_val[2] = _abil_map[? "state_time"]
		_mod_rate = -(_val[1] + _val[2]) * _val[0]
		sc_logging("Rating of", _a_name , "state Kamikaze" , (_mod_rate * _role))
		sc_logging("Cost state Kamikaze", string(_val[1]), undefined, undefined)
		sc_logging("Cost for difference of lifetime/cooldown", string(_val[2]), undefined, undefined)
				break
	}
	case 25: {	// гипноз
		_val[1] = 30
		_val[2] = (_abil_map[? "state_time"] - (_abil_map[? "state_cooldown"] * 0.25)) / 2
		_mod_rate = -_val[1] * _val[2] * _val[0]
		sc_logging("Rating of", _a_name , "state Hypnotize", (_mod_rate * _role))
		sc_logging("Cost state Hypnotyze", string(_val[1]), undefined, undefined)
		sc_logging("Cost for difference of lifetime/cooldown", string(_val[2]), undefined, undefined)
		break
	}
	case 26: {	// снижение точности
		_val[1] = 1.4
		_val[2] = _abil_map[? "state_value"]
		_val[3] = (_abil_map[? "state_time"] - (_abil_map[? "state_cooldown"] * 0.25)) / 5
		_mod_rate = -(_val[1] * _val[2] * _val[3]) * _val[0] * 0.1
		sc_logging("Rating of", _a_name , "state Confusion", (_mod_rate * _role))
		sc_logging("Cost state Confusion", string(_val[1]), undefined, undefined)
		sc_logging("Value", string(_val[2]) + "%", "degrease accuracy", undefined)
		sc_logging("Cost for difference of lifetime/cooldown", string(_val[3]), undefined, undefined)
		break
	}
	case 27: {	// телекинез
		_cur_rate += 250 // не зависит от роли атаки "buff"
		sc_logging("Rating of", _a_name , "state Telekinetic", 250)
		sc_logging("Cost state Telekinetic", "250", undefined, undefined)
		break
	}
	case 28: {	// телепортация
		_val[1] = 48
		_val[2] = (50 /_abil_map[? "state_value"] - (_abil_map[? "state_cooldown"] * 0.25)) / 2
		_val[3] = _abil_map[? "state_time"]
		_val[4] = (_val[1] + _val[2]) * _val[3] * _val[0]
		_cur_rate += _val[4] // не зависит от роли атаки "buff"
		sc_logging("Rating of", _a_name , "state Teleport", _val[4])
		sc_logging("Cost state Teleport", string(_val[1]), undefined, undefined)
		sc_logging("Distance moving", string(_val[3]), undefined, undefined)
		sc_logging("Cost for difference of lifetime/cooldown", string(_val[2]), undefined, undefined)
		break
	}
	case 29: {	// буст ближняя
		_val[1] = 1.3
		_val[2] = _abil_map[? "state_value"]
		_val[3] = (_abil_map[? "state_time"] - (_abil_map[? "state_cooldown"] * 0.25)) / 5
		_mod_rate = (_val[1] * _val[2] * _val[3]) * _val[0] * 0.1
		sc_logging("Rating of", _a_name , "state Melee up", (_mod_rate * _role))
		sc_logging("Cost state Melee up", string(_val[1]), undefined, undefined)
		sc_logging("Value", string(_val[2]) + "%", "increase melee damage", undefined)
		sc_logging("Cost for difference of lifetime/cooldown", string(_val[3]), undefined, undefined)
		break
	}
	case 30: {	// буст дальняя
		_val[1] = 1.6
		_val[2] = _abil_map[? "state_value"]
		_val[3] = (_abil_map[? "state_time"] - (_abil_map[? "state_cooldown"] * 0.25)) / 5
		_mod_rate = (_val[1] * _val[2] * _val[3]) * _val[0] * 0.1
		sc_logging("Rating of", _a_name , "state Range up", (_mod_rate * _role))
		sc_logging("Cost state Range up", string(_val[1]), undefined, undefined)
		sc_logging("Value", string(_val[2]) + "%", "incease ranged damage", undefined)
		sc_logging("Cost for difference of lifetime/cooldown", string(_val[3]), undefined, undefined)
		break
	}
	case 31: {	// лечение 1
		_val[1] = 2.35
		_val[2] = _abil_map[? "state_value"]
		_val[3] = _abil_map[? "state_time"] - (_abil_map[? "state_cooldown"] * 0.25)
		_mod_rate = (_val[1] * _val[2] * _val[3]) * _val[0]
		sc_logging("Rating of", _a_name , "state Heal", (_mod_rate * _role))
		sc_logging("Cost state Heal", string(_val[1]), undefined, undefined)
		sc_logging("Value per sec", string(_val[2]), "restore health", undefined)
		sc_logging("Cost for difference of lifetime/cooldown", string(_val[3]), undefined, undefined)
		break
	}
	case 32: {	// лечение 2
		_val[1] = 2.85
		_val[2] = _abil_map[? "state_value"]
		_val[3] = _abil_map[? "state_time"] - (_abil_map[? "state_cooldown"] * 0.25)
		_mod_rate = (_val[1] * _val[2] * _val[3]) * _val[0]
		sc_logging("Rating of", _a_name , "state Cure", (_mod_rate * _role))
		sc_logging("Cost state Cure", string(_val[1]), undefined, undefined)
		sc_logging("Value per sec", string(_val[2]), "restore health and clear damager states", undefined)
		sc_logging("Cost for difference of lifetime/cooldown", string(_val[3]), undefined, undefined)
		break
	}
	case 33: {	// лечение 3
		_val[1] = 3.45
		_val[2] = _abil_map[? "state_value"]
		_val[3] = _abil_map[? "state_time"] - (_abil_map[? "state_cooldown"] * 0.25)
		_mod_rate = (_val[1] * _val[2] * _val[3]) * _val[0]
		sc_logging("Rating of", _a_name , "state Medicine", (_mod_rate * _role))
		sc_logging("Cost state Medicine", string(_val[1]), undefined, undefined)
		sc_logging("Value per sec", string(_val[2]), "restore health clear damager and negative states", undefined)
		sc_logging("Cost for difference of lifetime/cooldown", string(_val[3]), undefined, undefined)
		break
	}
	case 34: {	// снятие эффектов
		_val[1] = 40
		_val[2] = (_abil_map[? "state_time"] - (_abil_map[? "state_cooldown"] * 0.25)) / 2
		_val[3] = (_val[1] * _val[2]) * _val[0]
		_cur_rate += _val[3] // не зависит от роли атаки "buff"
		sc_logging("Rating of", _a_name , "state Clear", _val[3])
		sc_logging("Cost state Clear", string(_val[1]), undefined, undefined)
		sc_logging("Cost for difference of lifetime/cooldown", string(_val[2]), undefined, undefined)
		break
	}
	case 35: {	// уверенность
		_val[1] = 25
		_val[2] = (_abil_map[? "state_time"] - (_abil_map[? "state_cooldown"] * 0.25)) / 2
		_mod_rate = (_val[1] * _val[2]) * _val[0]
		sc_logging("Rating of", _a_name , "state Confidance", (_mod_rate * _role))
		sc_logging("Cost state Confidance", string(_val[1]), undefined, undefined)
		sc_logging("Cost for difference of lifetime/cooldown", string(_val[2]), undefined, undefined)
		break
	}
	case 36: {	// отражение
		_val[1] = 35
		_val[2] = _abil_map[? "state_time"] - (_abil_map[? "state_cooldown"] * 0.25)
		_mod_rate = (_val[1] * _val[2]) * _val[0]
		sc_logging("Rating of", _a_name , "state Reflect", (_mod_rate * _role))
		sc_logging("Cost state Reflect", string(_val[1]), undefined, undefined)
		sc_logging("Cost for difference of lifetime/cooldown", string(_val[2]), undefined, undefined)
		break
	}
	case 37: {	// поглощение
		_val[1] = 3.6
		_val[2] = _abil_map[? "state_value"]
		_val[3] = (_abil_map[? "state_time"] - (_abil_map[? "state_cooldown"] * 0.25)) / 2
		_mod_rate = (_val[1] * _val[2] * _val[3]) * _val[0] * 0.1
		sc_logging("Rating of", _a_name , "state Block", (_mod_rate * _role))
		sc_logging("Cost state Blok", string(_val[1]), undefined, undefined)
		sc_logging("Value", string(_val[2]) + "%", "reduce damage", undefined)
		sc_logging("Cost for difference of lifetime/cooldown", string(_val[3]), undefined, undefined)
		break
	}
	case 38: {	// ловкость
		_val[1] = 4.3
		_val[2] = _abil_map[? "state_value"]
		_val[3] = (_abil_map[? "state_time"] - (_abil_map[? "state_cooldown"] * 0.25)) / 3
		_mod_rate = (_val[1] * _val[2] * _val[3]) * _val[0] * 0.1
		sc_logging("Rating of", _a_name , "state Dextery", (_mod_rate * _role))
		sc_logging("Cost state Dextery", string(_val[1]), undefined, undefined)
		sc_logging("Value", string(_val[2]) + "%", "increace dodge", undefined)
		sc_logging("Cost for difference of lifetime/cooldown", string(_val[3]), undefined, undefined)
		break
	}
	case 39: {	// обоюдный урон
		_val[1] = -1
		_val[2] = _abil_map[? "state_value"]
		_mod_rate = (_val[1] * _val[2]) * (1 - _val[0])
		sc_logging("Rating of", _a_name , "state Desperate",(_mod_rate * _role))
		sc_logging("Cost state Desperate", string(_val[1]), undefined, undefined)
		sc_logging("Percent of return damage", string(_val[2]),"and chanse not to take damage", string((1-_val[0])*100) + "%")
		break
	}
	case 40: {	// трещина
		_val[1] = 45
		_val[2] = _abil_map[? "state_time"] - (_abil_map[? "state_cooldown"] * 0.25)
		_mod_rate = -(_val[1] * _val[2]) * _val[0]
		sc_logging("Rating of", _a_name , "state Wreak", (_mod_rate * _role))
		sc_logging("Cost state Wreak", string(_val[1]), undefined, undefined)
		sc_logging("Cost for difference of lifetime/cooldown", string(_val[2]), undefined, undefined)
		break
	}
	case 41: {	// силовой щит
		_val[1] = 0.1
		_val[2] = _abil_map[? "state_value"]
		_val[3] = (_abil_map[? "state_time"] - (_abil_map[? "state_cooldown"] * 0.25)) / 2
		_mod_rate = (_val[1] * _val[2] * _val[3]) * _val[0]
		sc_logging("Rating of", _a_name , "state Barrier", (_mod_rate * _role))
		sc_logging("Cost state Barrier", string(_val[1]), undefined, undefined)
		sc_logging("Durability", string(_val[2]), "of segment", undefined)
		sc_logging("Cost for difference of lifetime/cooldown", string(_val[3]), undefined, undefined)
		break
	}
}

_cur_rate += _mod_rate * _role

if is_buff = undefined
	_cur_rate = abs(_cur_rate)

return _cur_rate
}	


