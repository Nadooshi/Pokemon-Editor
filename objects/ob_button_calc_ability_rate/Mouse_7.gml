event_inherited();

var _ability_names = sc_map_to_list(ability_list)
var _rating = 0
var _ability = ds_map_create()

ini_open(path)
for (var i=0; i<ds_list_size(_ability_names); i++) {
	ds_map_clear(_ability)
	ds_map_read(_ability, bini_sections[? "abilities"][? _ability_names[| i]])
	
	_rating = sc_calc_rate_ability_state(_ability,undefined, undefined, 10)
	ds_map_set(_ability, "rating", _rating)
	ini_write_string("abilities", _ability[? "name"], ds_map_write(_ability))
}
ini_close()

//log rating
fname = file_text_open_write("log_all_ability.txt")

var _log = ""
for (var i = 0; i < ds_list_size(logging); i ++){
		
	_log = ds_list_find_value(logging, i)
	file_text_write_string(fname, _log)
	file_text_writeln(fname)

}
ds_list_clear(logging)
file_text_close(fname);


//reload bini
bini_unload()
bini_load(path)

ds_map_destroy(_ability)

