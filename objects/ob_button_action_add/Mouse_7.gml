/// @desc

// Inherit the parent event
event_inherited();

ds_stack_push(map_stack, sc_new_action())
ds_stack_push(previous_map_stack, sc_new_action())

edit_mode = false
ds_stack_push(room_stack, room)
room_goto(rm_attack_editor)

