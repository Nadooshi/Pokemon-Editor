/// @arg name
/// @arg ds_map_id
function sc_load_pokemon(argument0, argument1) {

	// cannot create ds_map here. Its Id won't be saved outside this script

	var _name = argument0
	var _ds = argument1
	if ds_exists(_ds, ds_type_map) {
		ds_map_read(_ds, bini_sections[? "pokemons"][? _name])
		_ds[? "actions"] = ds_map_create()
		ds_map_read(_ds[? "actions"], bini_sections[? "binded_actions"][? _name])
	}




}
