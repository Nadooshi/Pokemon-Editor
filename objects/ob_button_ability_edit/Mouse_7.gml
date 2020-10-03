/// @desc

// Inherit the parent event
event_inherited();

ds_map_read(current_ability, bini_sections[? "abilities"][? parent.name])
ds_map_copy(previous_map, current_ability)

ds_stack_push(map_stack, current_ability)
ds_stack_push(previous_map_stack, previous_map)

ds_stack_push(room_stack, room)
room_goto(rm_ability_editor)
