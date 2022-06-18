/// @desc

if is_undefined(parent)
	exit
if not instance_exists(parent)
	exit

sc_load_pokemon(parent.name, pokemon)

image_index = pokemon[? "face"]

