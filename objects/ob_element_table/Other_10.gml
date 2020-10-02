/// @desc

if parameter_name != "" {
	var _index = real(parameter_name)
	var _elem = element_table[parent.index]
	image_index = _elem[_index]
	hint = elemental_text[_elem[_index]]
	
	if _elem[_index] = _ELEMENTAL.none
		exit;
	
	// check validity
	var _elem2 = 0
	var _weak_match = 0
	valid = true
	
	// same elements inside frame
	//sc_element_check_valid(!(_elem[_index] = parent.index ), noone)
	valid = valid and !(_elem[_index] = parent.index )
	for (var j=0; j<3; j++) 
	if _index != j
		valid = valid and !(_elem[_index] = _elem[j])

	switch _index {
	case 0:
		// unique defense
		for (var j=0; j<array_length_1d(element_table); j++)
		if j != parent.index {
			_elem2 = element_table[j]
			valid = valid and !(_elem[0] = _elem2[0])

			if not valid
				break
		}
		// mutual defences
		_elem2 = element_table[_elem[0]]
		valid = valid and (parent.index != _elem2[0])
		// defense not equal defense's weakness
		valid = valid and ((parent.index != _elem2[1]) and (parent.index != _elem2[2]))
		
	break	
	case 1:
	case 2:
		// repeated weaknesses
		for (var j=0; j<array_length_1d(element_table); j++)
		if j != parent.index {
			_elem2 = element_table[j]
			if (_elem[_index] = _elem2[1]) or (_elem[_index] = _elem2[2])
				_weak_match++
			valid = valid and (_weak_match <= 1)

			if not valid
				break
		}
		// mutual weaknesses
		_elem2 = element_table[_elem[_index]]
		valid = valid and ((parent.index != _elem2[1]) and (parent.index != _elem2[2]))
		// defense not equal defense's weakness
		valid = valid and (_elem2[0] != parent.index)
	break	
	default:
	
	}
}

if valid != o_valid 
	event_perform(ev_other, ev_user2)

o_valid = valid
