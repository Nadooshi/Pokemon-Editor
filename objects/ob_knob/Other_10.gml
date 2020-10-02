/// @desc

value = ds_map_find_value(current_action, parameter_name)
position = clamp((value - min_value) / step, 0, pos_count)

image_angle = min_angle + pos_angle * position
