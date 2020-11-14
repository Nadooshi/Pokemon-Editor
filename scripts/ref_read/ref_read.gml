/// @desc Read value from ds_map by reference
/// @arg ref
function ref_read(_ref) {

	//return ds_map_find_value(_ref[0], _ref[1])
	return _ref[0][? _ref[1]]

}
