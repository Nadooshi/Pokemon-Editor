/// @desc 
var _h = string_height(hint)
var _w = string_width(hint)
if show_hint
if hint != "" {
	draw_set_font(fn_card)
	draw_set_color(c_black)
	if not layer_exists("Hints")
		layer_create(-1, "Hints")
	frame = instance_find(ob_frame_hint, 0)
	if frame = -4
		frame = instance_create_layer(mouse_x, mouse_y,"Hints",ob_frame_hint)
	var _sx = 1 / sprite_get_width(ob_frame_hint.sprite_index)
	var _sy = 1 / sprite_get_height(ob_frame_hint.sprite_index)
	frame.image_xscale = (_sx * _w) + 0.3
	frame.image_yscale = (_sy * _h) + 0.3
	frame.x = mouse_x - _w * 0.5
	frame.y = mouse_y
	
	draw_text(frame.x + 16, frame.y + 16, hint)
	draw_set_color(c_white)
	draw_text(frame.x + 14, frame.y + 14, hint)
	
}

event_perform(ev_other, ev_user1)
