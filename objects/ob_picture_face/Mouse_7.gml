/// @desc 

// Inherit the parent event
event_inherited();

ds_stack_push(map_stack, dedicated_map)
ds_stack_push(previous_map_stack, previous_map)

ds_stack_push(room_stack, room)
room_goto(rm_select_sprite)
