/// @desc
if not init {
	init = true
	if instance_exists(parent)
		image_blend = parent.valid ? c_lime : c_red
}

phi += 0.05
image_alpha = power(sin(phi), 4)
if phi > pi	
	instance_destroy()

