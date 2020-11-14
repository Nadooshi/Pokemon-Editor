/// @desc Find precence in pokemons

var _pokemon = ds_map_create()
var _p_arr = []
var _actions = noone

ds_map_keys_to_array(pokemon_list, _p_arr)
for (var i=0; i<pokemon_list_count; i++) {
	sc_load_pokemon(_p_arr[i], _pokemon)
	_actions = sc_map_to_list(_pokemon[? "actions"])
	if ds_list_find_index(_actions, parent.name) > -1 
		ds_list_add(precence_list, _p_arr[i])
	// clean up
	sc_clear_pokemon(_pokemon)
	ds_map_clear(_pokemon)
	ds_list_destroy(_actions)
}

if ds_list_size(precence_list)=0 
	instance_destroy()
else {
	hint = ""
	for (var i=0; i<ds_list_size(precence_list); i++) 
		hint += precence_list[| i] + "\n"
}
