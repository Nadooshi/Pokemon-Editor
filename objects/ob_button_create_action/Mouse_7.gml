/// @desc


ds_stack_push(map_stack, dedicated_map)
ds_stack_push(previous_map_stack, previous_map)

edit_mode = true
edit_value = ref_make(dedicated_map, "actions")

ds_stack_push(map_stack, sc_new_action())
ds_stack_push(previous_map_stack, sc_new_action())
ds_stack_push(ref_stack, edit_value)

ds_stack_push(room_stack, room)
room_goto(rm_attack_editor)


