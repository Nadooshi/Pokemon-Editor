/// @desc
event_inherited()

pos_count = round((max_value - min_value) / step)
reg_range = bbox_right - bbox_left 
reg_range *= 0.9
pos_range = reg_range / pos_count
position = 0

drag = false
oX = x
curX = 0
