/// @desc

ds_map_delete(pokemon_list,  name)
pokemon_list_count = ds_map_size(pokemon_list)

ini_open(path)
	ini_write_string("pokemons", "pokemon_list", ds_map_write(pokemon_list))
ini_close()
// reload bini
bini_unload()
bini_load(path)

parent.image_alpha = 0.5
instance_destroy()
