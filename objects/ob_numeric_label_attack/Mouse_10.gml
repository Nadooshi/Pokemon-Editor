/// @desc

// Inherit the parent event
event_inherited();

var f = current_action [? "act_force"]
var l = current_action [? "level"]
var p = current_action [? "ap"]

if index != 0
	hint = sc_hint_formula(index,f,l,p)
