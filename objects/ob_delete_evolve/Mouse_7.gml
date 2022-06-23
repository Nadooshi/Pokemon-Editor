/// @desc

// Inherit the parent event
event_inherited();

if not instance_exists(parent)
	exit
	
var _node = evolution_tree[? parent.name]
var _parent = evolution_tree[? _node.parent]
if not is_undefined(_parent)
	array_delete(_parent.children, sc_find_in_array(_parent.children, parent.name) , 1)
for (var i=0; i<array_length(_node.children); i++) {
	evolution_tree[? _node.children[i]].base = ""
	evolution_tree[? _node.children[i]].parent = ""
}

evolution_tree[? parent.name].base = ""
evolution_tree[? parent.name].parent = ""

room_restart()
