/// @desc

if ds_exists(current_action, ds_type_map)
	ds_map_destroy(current_action)
if ds_exists(current_pokemon, ds_type_map)
	ds_map_destroy(current_pokemon)
if ds_exists(current_ability, ds_type_map)
	ds_map_destroy(current_ability)

for (var i=0; i<array_length_1d(ability_slot); i++)
	ds_map_destroy(ability_slot[i])

for (var i=0; i<array_length_1d(action_slot); i++)
	ds_map_destroy(action_slot[i])

for (var i=0; i<array_length_1d(element_slot); i++)
	ds_map_destroy(element_slot[i])

ds_map_destroy(p_stage)

ds_map_destroy(action_list)
ds_map_destroy(ability_list)

if ds_exists(pokemon_list, ds_type_map)
	ds_map_destroy(pokemon_list)
if ds_exists(pokemon_list, ds_type_list)
	ds_list_destroy(pokemon_list)

sc_cleanup_globals()

bini_unload()

