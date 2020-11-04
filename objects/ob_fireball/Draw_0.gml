/// @desc

fr_index = (fr_index + fr_speed) mod fr_count

gpu_set_blendmode(bm_add)
draw_sprite_ext(sp_fireball, fr_index  , x, y+12, image_xscale, image_yscale, 0, c_white, (1-frac(fr_index))*image_alpha)
draw_sprite_ext(sp_fireball, fr_index+1, x, y+12, image_xscale, image_yscale, 0, c_white,    frac(fr_index) *image_alpha)
gpu_set_blendmode(bm_normal)
