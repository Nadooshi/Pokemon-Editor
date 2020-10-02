/// @desc

current_ability = ds_stack_pop(map_stack)
dedicated_map = current_ability
previous_map = ds_stack_pop(previous_map_stack)
edit_value = ds_stack_pop(ref_stack)

sc_refresh_ui()
