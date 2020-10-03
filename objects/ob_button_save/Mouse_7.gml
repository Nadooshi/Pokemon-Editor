/// @desc 

// Inherit the parent event
event_inherited();


ds_map_add(pokemon_list, current_pokemon[? "title"], true)
pokemon_list_count = ds_map_size(pokemon_list)

ini_open(path)
	ini_write_string("pokemons", current_pokemon[? "title"] , ds_map_write(current_pokemon))
	ini_write_string("binded_actions", current_pokemon[? "title"], ds_map_write(current_pokemon[? "actions"])) 
	ini_write_string("pokemons", "pokemon_list", ds_map_write(pokemon_list))
ini_close()
// reload bini
bini_unload()
bini_load(path)

sc_get_p_stage()

ds_map_copy(previous_map, current_pokemon)

