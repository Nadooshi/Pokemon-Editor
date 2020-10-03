/// @desc

// Inherit the parent event
event_inherited();

ds_map_read(current_action, bini_sections[? "actions"][? parent.name])
ds_map_copy(previous_map, current_action)

ds_stack_push(map_stack, current_action)
ds_stack_push(previous_map_stack, previous_map)

edit_mode = false
ds_stack_push(room_stack, room)
room_goto(rm_attack_editor)
