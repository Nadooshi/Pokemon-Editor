globalvar bini_loaded;
bini_loaded = false
globalvar bini_sections;

function bini_load(filepath) {
	if not file_exists(filepath)
		return false
		
	bini_sections = ds_map_create()
	bini_loaded = true
	var _f = file_text_open_read(filepath)
	var _s = ""
	var _s_len = 0
	var _ch_section = ord("[")
	var _ch_valuepair = 0
	var _current_section = ""
	var _fail = false
	
	while not file_text_eof(_f) {
		_s = file_text_readln(_f)
		_s_len = string_length(_s)
		_ch_valuepair = string_pos("=", _s)
		// add new value
		if _ch_valuepair > 0 {
			if _current_section="" {
				show_message("Wrong INI file!")
				_fail = true
				break
			}
			ds_map_add(bini_sections[? _current_section], string_copy(_s, 1, _ch_valuepair-1), string_copy(_s, _ch_valuepair+2, _s_len-_ch_valuepair-4))
		} else
		// add new section
		if string_byte_at(_s, 1) = _ch_section {
			_current_section = string_copy(_s, 2, _s_len-4)
			ds_map_add(bini_sections, _current_section, ds_map_create())
		}
	}
	file_text_close(_f)

	if _fail {
		bini_unload()
		return false
	}
	return true
}

function bini_unload() {
	if not bini_loaded
		return false
		
	var _m = ds_map_find_first(bini_sections)
	while not is_undefined(_m) {
		ds_map_destroy(bini_sections[? _m])
		_m = ds_map_find_next(bini_sections, _m)
	}
	ds_map_destroy(bini_sections)
	bini_loaded = false
	return true
}
