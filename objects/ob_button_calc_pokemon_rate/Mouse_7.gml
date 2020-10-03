event_inherited();

var _names = sc_map_to_list(pokemon_list)
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

//reload bini
bini_unload()
bini_load(path)

ds_map_destroy(_pokemon)

