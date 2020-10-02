/// @desc Init room

var _spritesize = 175
var _xcount = 10
var _spacesize = (room_width - _spritesize * _xcount) / (_xcount+1)

var _facescale = _spritesize / sprite_get_width(sp_face_all)
var _framescale = _spritesize / sprite_get_width(sp_frame)

var _maxcount = sprite_get_number(sp_face_all)
var _ycount = ceil(_maxcount / _xcount)
var _count = 0

room_height = max(1080, (_spritesize + _spacesize) * _ycount)

var i = 0
var k = 0
var stop = false

while not stop {
	for (k=0; k<_xcount; k++) {
		if _count = _maxcount {
			stop = true
			break
		}
		var _x = (_spacesize + _spritesize) * k +_spacesize
		var _y = (_spacesize + _spritesize) * i +_spacesize
		with instance_create_layer(_x, _y, "Frames", ob_frame) {
			image_xscale = _framescale
			image_yscale = _framescale
		}
		with instance_create_layer(_x, _y, "Sprites", ob_face_variant) {
			image_xscale = _facescale
			image_yscale = _facescale
			image_index = _count + 0.01
			value = _count
		}
		_count++
	}
	i++
}


