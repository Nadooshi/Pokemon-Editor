/// @desc Clean conflicts

var i = 0
while i < ds_list_size(conflict_list) {
	if ds_exists(conflict_list[| i], ds_type_list) {
		var j = 0
		var _list = conflict_list[| i]
		while j < ds_list_size(_list) {
			if _list[| j].conflict = noone {
				ds_list_delete(_list, j)
				continue
			}
			j++
		}
		if ds_list_size(_list) = 0 {
			ds_list_destroy(_list)
			continue
		}
	} else {
		ds_list_delete(conflict_list, i)
		continue
	}
	i++
}
