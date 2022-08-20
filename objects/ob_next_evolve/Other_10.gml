/// @desc

if is_undefined(parent)
	exit
if not instance_exists(parent)
	exit

if sc_load_pokemon(parent.name, pokemon) // if success set index to image
	image_index = pokemon[? "face"]

