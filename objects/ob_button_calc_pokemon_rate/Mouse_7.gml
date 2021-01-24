event_inherited();

var _names = ds_list_create()
_names = sc_map_to_list(pokemon_list)
var _rating = 0
var _pokemon = ds_map_create()

ini_open(path)
for (var i=0; i<ds_list_size(_names); i++) {
	ds_map_clear(_pokemon)
	ds_map_read(_pokemon, bini_sections[? "pokemons"][? _names[| i]])
	_pokemon[? "actions"] = ds_map_create()
	ds_map_read(_pokemon[? "actions"], bini_sections[? "binded_actions"][? _names[| i]])
	
	_rating = sc_rate_pokemon(_pokemon)
	ds_map_set(_pokemon, "rating", _rating)
	ini_write_string("pokemons", _names[| i], ds_map_write(_pokemon))
	ds_map_destroy(_pokemon[? "actions"])
}
ini_close()

// logging
fname = file_text_open_write("log_all_pokemons.txt")

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


ds_map_destroy(_pokemon)

