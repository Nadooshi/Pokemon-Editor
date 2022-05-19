/// @desc
event_inherited();
ds_stack_push(map_stack, current_pokemon)
ds_stack_push(room_stack, room)
edit_mode = false
edit_value = ref_make(current_pokemon, "evolution")
room_goto(rm_loader)


