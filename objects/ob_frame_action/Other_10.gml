/// @desc

// all right
dedicated_map = ds_map_create()

ds_map_read(dedicated_map, bini_sections[? "actions"][? name])
event_inherited();
	
if room = rm_editor
if not is_undefined(dedicated_map[? "act_force"]) and not is_undefined(current_pokemon[? "force"]) 
if dedicated_map[? "act_force"] > current_pokemon[? "force"]
image_blend = c_red

ds_map_destroy(dedicated_map)
