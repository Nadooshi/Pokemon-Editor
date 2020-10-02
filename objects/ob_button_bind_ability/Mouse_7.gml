/// @desc

edit_mode = false
ds_stack_push(room_stack, room)
ds_stack_push(map_stack, dedicated_map)
ds_stack_push(previous_map_stack, previous_map)
ds_stack_push(ref_stack, edit_value)

edit_value = ref_make(dedicated_map, parameter_name)
ds_stack_push(ref_stack, edit_value)
room_goto(rm_abilities)
