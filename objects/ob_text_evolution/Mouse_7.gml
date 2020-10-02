/// @desc

edit_mode = false
ds_stack_push(map_stack, dedicated_map)
ds_stack_push(previous_map_stack, previous_map)
ds_stack_push(room_stack, room)
edit_value = ref_make(dedicated_map, "evolution")
room_goto(rm_loader)
