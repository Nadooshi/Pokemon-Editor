/// @arg string
function sc_normalize_string(argument0) {

	var _string = argument0
	var _result = ""

	var _last = font_get_last(fn_card)
	for (var i=1; i<=string_length(_string); i++)
	if ord(string_char_at(_string, i)) <= _last
		_result += string_char_at(_string, i)

	return _result



}
