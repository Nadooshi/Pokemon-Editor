/// @desc

// Inherit the parent event
event_inherited();

sc_clear_pokemon(current_pokemon)
ds_map_copy(previous_map, current_pokemon)
ds_stack_push(map_stack, current_pokemon)
ds_stack_push(previous_map_stack, previous_map)

ds_stack_push(room_stack, room)
room_goto(rm_editor)
