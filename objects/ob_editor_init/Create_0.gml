/// @desc

var i = 0
var str = ["passive_1", "passive_2"]

with ob_button_bind_ability
	sc_create_slot_composed(x, y, "", ability_slot)

with ob_frame_ability {
	parameter_name = str[i]
	i++
}
