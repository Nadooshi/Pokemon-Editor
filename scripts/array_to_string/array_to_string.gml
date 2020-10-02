/// @arg array
/// @arg [sep]
function array_to_string() {

	var _arr = argument[0]
	var _sep = ", "
	if argument_count > 1
		_sep = argument[1]
	var _result = ""	

	for (var i=0; i<array_length_1d(_arr)-1; i++)
		_result += string(_arr[i]) + _sep
	_result += string(_arr[i]) 
	
	return _result



}
