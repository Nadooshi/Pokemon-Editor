/// @desc

edit_mode = false
ds_stack_push(room_stack, room)
ds_stack_push(map_stack, dedicated_map)
ds_stack_push(previous_map_stack, previous_map)

edit_value = ref_make(dedicated_map, parameter_name)
// там будет изменяться не один параметр, а ds_map
ds_stack_push(room_stack, room)
room_goto(rm_action_list)
