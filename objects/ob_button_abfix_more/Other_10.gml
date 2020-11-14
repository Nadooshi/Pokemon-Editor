/// @desc Find precence in pokemons

var _p_arr = array_create(0, 0)
var _a_arr = array_create(0, 0)
var _pokemon = ds_map_create()
var _attack = ds_map_create()

ds_map_keys_to_array(pokemon_list, _p_arr)
ds_map_keys_to_array(action_list, _a_arr)

for (var i=0; i<pokemon_list_count; i++) {
	sc_load_pokemon(_p_arr[i], _pokemon)
	if _pokemon[? "passive_1"] = parent.name
		ds_list_add(precence_list[0], "    " + _p_arr[i])
	if _pokemon[? "passive_2"] = parent.name
		ds_list_add(precence_list[0], "    " + _p_arr[i])
	// clean up
	sc_clear_pokemon(_pokemon)
	ds_map_clear(_pokemon)
}
var _s = ""
for (var i=0; i<action_list_count; i++) {
	_s = bini_sections[? "actions"][? _a_arr[i]]
	ds_map_read(_attack, _s)
	if _attack[? "active"] = parent.name
		ds_list_add(precence_list[1], "    " + _a_arr[i])
	
}

if ds_list_size(precence_list[0])=0 and
   ds_list_size(precence_list[1])=0
	instance_destroy()
else {
	hint = "Pokemons: \n"
	
	for (var i=0; i<ds_list_size(precence_list[0]); i++) 
		hint += "   " + precence_list[0][| i] + "\n"
		
	hint += "Actions: \n"
	for (var i=0; i<ds_list_size(precence_list[1]); i++) 
		hint += "   " + precence_list[1][| i] + "\n"
}
