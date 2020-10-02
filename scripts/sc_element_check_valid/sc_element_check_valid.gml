/// @arg condition
/// @arg element
function sc_element_check_valid(argument0, argument1) {

	var _valid = argument0
	var _elem = argument1

	valid = valid and _valid

	if valid {
		conflict = noone
	} else
	if conflict != noone {
		// add to existing conflict
		if instance_exists(_elem)
		if ds_list_find_index(conflict_list[| conflict], _elem) = -1 {
			ds_list_add(conflict_list[| conflict], _elem)
			_elem.conflict = conflict
		}
	} else {
		// new conflict	
		var new_id = ds_list_size(conflict_list)
		ds_list_add(conflict_list, ds_list_create())
		conflict = new_id
	 	ds_list_add(conflict_list[| new_id], id, _elem)
	}



}
