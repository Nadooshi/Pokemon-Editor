/// @desc

event_perform_object(ob_ui_object, ev_draw, 0)

draw_sprite_ext(sp_frame, 0, x + curX, y, image_xscale*0.1, image_yscale, 0, c_white, 1)

var _w = bbox_right - bbox_left
var _x1 = x + _w / 4 - string_width(value) / 2
var _x2 = x + _w / 4 * 3 - string_width(value) / 2
//var _y = y + ((bbox_bottom - bbox_top) - 12) / 2

draw_set_font(fn_card)
draw_set_color(c_black)
draw_text(_x1, y-8, max_value - value)
draw_set_color(c_white)
draw_text(_x1-2, y-8-2, max_value - value)

draw_set_color(c_black)
draw_text(_x2, y-8, value)
draw_set_color(c_white)
draw_text(_x2-2, y-8-2, value)

