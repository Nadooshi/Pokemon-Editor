/// @desc 

// Inherit the parent event
if popup_appeared
	exit

event_inherited();

var _ok = true
with ob_element_table
	_ok = _ok and valid
	
if not _ok
	_ok = show_question("You have some conflicts in the table!\nSave anyway?")
	
if _ok {
	ini_open(path)
		for (var i=0; i<array_length_1d(element_table); i++)
			ini_write_string("element_table", string(i), array_to_string(element_table[i]))
	ini_close()
	// reload bini
	bini_unload()
	bini_load(path)
}
