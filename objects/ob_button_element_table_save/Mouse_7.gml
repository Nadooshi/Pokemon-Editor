/// @desc 

// Inherit the parent event
if popup_appeared
	exit

event_inherited();
var _arr_save = noone
var _reg_ini = ""
switch index {
	case 0:
		_arr_save = element_table
		_reg_ini = "element_table"
	break;
	case 1:
		_arr_save = aura_table
		_reg_ini = "aura_table"
	break;
}
var _ok = true
with ob_element_table
	_ok = _ok and valid
	
if not _ok
	_ok = show_question("You have some conflicts in the table!\nSave anyway?")
	
if _ok {
	ini_open(path)
		for (var i=0; i<array_length_1d(_arr_save); i++)
			ini_write_string(_reg_ini, string(i), array_to_string(_arr_save[i]))
	ini_close()
	// reload bini
	bini_unload()
	bini_load(path)
}
