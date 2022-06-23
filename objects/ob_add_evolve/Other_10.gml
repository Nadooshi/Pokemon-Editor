/// @desc Show only for current pokemon

if instance_exists(parent)
if parent.name != current_pokemon[? "title"]
	instance_destroy()

