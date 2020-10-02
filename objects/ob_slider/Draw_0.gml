/// @desc

event_inherited()

draw_sprite_ext(sp_frame, 0, x + curX, y, image_xscale*0.1, image_yscale, 0, c_white, 1)

var _x = x + ((bbox_right - bbox_left) - string_width(value)) / 2
//var _y = y + ((bbox_bottom - bbox_top) - 12) / 2

draw_set_font(fn_card)
draw_set_color(c_black)
draw_text(_x, y-8, value)
draw_set_color(c_white)
draw_text(_x-2, y-8-2, value)


