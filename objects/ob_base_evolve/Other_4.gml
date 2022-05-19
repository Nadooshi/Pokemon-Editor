/// @desc init

function add_node(_name) {
	if not is_struct(evolution_tree[? _name]) {
		evolution_tree[? _name] = {
			children: [],
			parent: ""
		}
	}
}


current_pokemon = ds_stack_pop(map_stack)
// if new evolution selected via "evolution" parameter in current pokemon -> add node in evolution_tree
var _child_name = current_pokemon[? "evolution"]
var _parent_name = current_pokemon[? "title"]

if not is_undefined(_child_name) and _child_name != "" {
//	if not is_undefined(evolution_tree[? current_pokemon[? "title"]])
	add_node(_parent_name)
	if sc_find_in_array(evolution_tree[? _parent_name].children, _child_name) = -1 {
		array_push(evolution_tree[? _parent_name].children, _child_name)
		add_node(_child_name)
		evolution_tree[? _child_name].parent = _parent_name
		current_pokemon[? "evolution"] = ""
	}
}

// build evolution_tree
// find base

var _node = evolution_tree[? _parent_name]

while _node.parent != "" {
	_node = evolution_tree[? _node.parent]
	if is_undefined(_node)
		break
}
if not is_undefined(_node) {
	// _node is base node!
} else
	exit
	

sc_refresh_ui()


