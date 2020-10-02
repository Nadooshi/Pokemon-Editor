/// @desc
event_inherited()

pos_count = round((max_value - min_value) / step)
pos_angle = (max_angle - min_angle) / pos_count
position = 0
reg_range = room_height * 0.25
pos_range = reg_range / pos_count

drag = false
oX = x
oY = y
oPos = position
