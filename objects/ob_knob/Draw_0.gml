/// @desc

event_inherited()

var _w = string_width(caption)

draw_set_font(fn_card)
draw_set_color(c_black)
draw_text(x - _w*0.5, y - 8, caption)
draw_set_color(c_white)
draw_text(x - _w*0.5 - 2, y - 8 - 2, caption)
