function sc_calculate_formula(mode, force, lvl, pow) {
	// calculate recommended any value for show hints
	/// @arg mode
	/// @arg force
	/// @arg level
	/// @arg power

	if mode = 0 exit;
	if is_undefined(force) force = 0
	if is_undefined(lvl) lvl = 0
	if is_undefined(pow) pow = 0

	var coef
	var coef_lvl
	var result = 0
	coef[_FORCE.paltry	 ] = 0.91
	coef[_FORCE.frail	 ] = 0.95 
	coef[_FORCE.helpless ] = 0.98 
	coef[_FORCE.preferred] = 1	
	coef[_FORCE.reliable ] = 1.03 
	coef[_FORCE.strong	 ] = 1.07 
	coef[_FORCE.selective] = 1.12 
	coef[_FORCE.elite    ] = 1.18 
	coef[_FORCE.legendary] = 1.25
	coef[_FORCE.incredible] = 1.33

	coef_lvl[_FORCE.paltry	 ] = 0.045
	coef_lvl[_FORCE.frail	 ] = 0.043
	coef_lvl[_FORCE.helpless ] = 0.0418
	coef_lvl[_FORCE.preferred] = 0.041
	coef_lvl[_FORCE.reliable ] = 0.04
	coef_lvl[_FORCE.strong	 ] = 0.039
	coef_lvl[_FORCE.selective] = 0.038	
	coef_lvl[_FORCE.elite	 ] = 0.0368
	coef_lvl[_FORCE.legendary] = 0.0343
	coef_lvl[_FORCE.incredible] = 0.032
	enum norm{
		_health = 150, //custom 1st healt elite force
		_dmg = 100
	}

	switch (mode) {
		case 1:  // calculate health			
		case 2: 
			result = norm._health * coef[force] + lvl * coef_lvl[force] * norm._health * coef[force]
			break;
		case 3:  // calculate damage
			result = (norm._dmg * coef[force] + (lvl * coef_lvl[force] * norm._dmg * coef[force])) * 0.01 * pow
			break;
		case 4:  // nouse mode
			result = (norm._dmg * coef[_FORCE.elite] + (lvl * coef_lvl[_FORCE.elite] * norm._dmg * coef[_FORCE.elite])) * 0.01 * pow
			break;
	}

	return result
}


