
view_camera[view_index] = camera_create_view(view_x, view_y, view_w, view_h)

camX = view_x
background_layer_id = layer_get_id("Background")
var _bg = layer_background_get_id(background_layer_id)

// move background
if sprite_exists(layer_background_get_sprite(_bg))
camera_set_update_script(view_camera[view_index], function (){
	with ob_scroll_control
		layer_y(background_layer_id, camY)
})
