/// @desc Init room

var _spritesize = 300
var _xcount = room_width div _spritesize
var _spacesize = (room_width - _spritesize * _xcount) / (_xcount+1)

var _facescale = 3

var _ycount = ceil(maxcount / _xcount)
var _count = 0

room_height = max(1080, (_spritesize + _spacesize) * _ycount)

var i = 0
var k = 0
var stop = false

while not stop {
	for (k=0; k<_xcount; k++) {
		if _count = maxcount {
			stop = true
			break
		}
		var _x = (_spacesize + _spritesize) * k +_spacesize
		var _y = (_spacesize + _spritesize) * i +_spacesize
		_x += _spritesize * 0.5
		_y += _spritesize * 0.5
		with instance_create_layer(_x, _y, "Sprites", ob_anim_variant) {
			sprite_index = asset_get_index("sp_attack_"+string(_count))
			image_index = image_number div 2
			image_xscale = _facescale
			image_yscale = _facescale
			value = sprite_get_name(sprite_index)
			parameter_name = other.parameter_name
		}
		_count++
	}
	i++
}



