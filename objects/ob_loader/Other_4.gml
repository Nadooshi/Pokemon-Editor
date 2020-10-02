/// @desc Init room

var _sz = 128
var _maxcount = ceil((room_width - 64 - 96) / _sz)
var _rowscount = floor(pokemon_list_count / _maxcount) + 1

// sort by hash
var _sort_pokemon = sc_map_to_list(pokemon_list)
sc_sort_list_by_hash(_sort_pokemon)
//

var _name
var _count = 0

var i = 0
var k = 0
for (i=0; i<_rowscount; i++)
for (k=0; k<_maxcount; k++) {
	if _count > pokemon_list_count - 1
		break
	_name = _sort_pokemon[| _count]
	if is_undefined(_name)
		break
	sc_create_slot_loader(k*_sz+32+48, i*_sz+96+112, _name)
	_count++
}
ds_list_destroy(_sort_pokemon)

// set pictures for icons
var _temp = ds_map_create() // temporary pokemon
with ob_pokemon_icon {
	sc_load_pokemon(value, _temp)
	if (not is_undefined(_temp[? "face"]) or (_temp[? "face"]="") )
		image_index = _temp[? "face"] + 0.01
}
with ob_rating_star {
	sc_load_pokemon(title, _temp)
	if (not is_undefined(_temp[? "rating"]) or (_temp[? "rating"]="") )
		caption = string(ceil(_temp[? "rating"]*0.01))
}
ds_map_destroy(_temp)

tx_mode_loader.caption = (edit_mode ? "Editing" : "Select") + " pokemon"
if not edit_mode
	instance_destroy(ob_button_add)
	
room_height = max(1080, _sz * _rowscount + 96+112)
