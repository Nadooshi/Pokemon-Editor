/// @desc

// Inherit the parent event
event_inherited();

ds_stack_push(map_stack, sc_new_ability())
ds_stack_push(previous_map_stack, sc_new_ability())

ds_stack_push(room_stack, room)
room_goto(rm_ability_editor)



