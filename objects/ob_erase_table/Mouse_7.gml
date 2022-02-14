/// @desc
var _arr_save
var _reg_ini
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
	
var _ok = show_question("Do you really want to erase the table?\n This action cannot be cancelled!")
	
if _ok {
	ini_open(path)
		for (var i=0; i<array_length_1d(_arr_save); i++) {
			_arr_save[i] = array_create(3, _ELEMENTAL.none)
			ini_write_string(_reg_ini, string(i), array_to_string(_arr_save[i]))
		}
	ini_close()
	// reload bini
	bini_unload()
	bini_load(path)
	
}



