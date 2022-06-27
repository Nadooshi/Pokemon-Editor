function sc_hint_formula(argument0, argument1, argument2, argument3) {
	// calculate recommended any value for show hints
	/// @arg mode
	/// @arg force
	/// @arg level
	/// @arg power

	var mode = argument0
	var force = argument1
	var lvl = argument2
	var pow = argument3
	var compl_hint = ""
	var result = 0

	if mode = 0 exit;

	switch (mode) {
		case 0: break;
		case 1: { // calculate health
			var _name = current_pokemon[? "title"]
			var pr_lvl = 1
			if not is_undefined(_name) 
			if not is_undefined(p_stage[? _name]) 
				pr_lvl = (p_stage[? _name]) + 1
			result = sc_calculate_formula(mode,force,pr_lvl,pow)
			compl_hint = "Recomended health value\nFor this stage: "+string(round(result))
			break;
		}
		case 2: { // calculate health
			result = sc_calculate_formula(mode,force,lvl,pow)
			compl_hint = "Recomended health value\nFor next stage: "+string(round(result))
			break;
		}
		case 3: { // calculate damage
			result = sc_calculate_formula(mode,force,lvl,pow)
			compl_hint = "Recomended damage value\n " + string(round(result*0.9)) + "~" + string(round(result))
			break;
		}
	}

	return compl_hint
	
	


}
