/// @desc init

function add_node(_name, _parent = "", _base = "") {
	if not is_struct(evolution_tree[? _name]) {
		evolution_tree[? _name] = {
			children: [],
			parent: _parent,
			base: _base
		}
	}
}

// if new evolution selected via "evolution" parameter in current pokemon -> add node in evolution_tree
var _child_name = current_pokemon[? "evolution"]
var _cur_name = current_pokemon[? "title"]

add_node(_cur_name)

// set base
var _parent_name = evolution_tree[? _cur_name].parent
if not is_undefined(_parent_name) and _parent_name != "" {
	if evolution_tree[? _parent_name].base != ""
		evolution_tree[? _cur_name].base = evolution_tree[? _parent_name].base
} else
		evolution_tree[? _cur_name].base = _cur_name

if not is_undefined(_child_name) and _child_name != "" {
	if sc_find_in_array(evolution_tree[? _cur_name].children, _child_name) = -1 {
		array_push(evolution_tree[? _cur_name].children, _child_name)
		add_node(_child_name, _cur_name, evolution_tree[? _cur_name].base)
		current_pokemon[? "evolution"] = ""
	}
}

// build evolution_tree
var _elem = ds_map_create()
_slot = []
var _count = 1

#region create slot

_elem[? "x"] = 0
_elem[? "y"] = 0
_elem[? "xs"] = fr_evol_node.image_xscale
_elem[? "ys"] = fr_evol_node.image_yscale
_elem[? "ob"] = ob_frame
_elem[? "param"] = ""

_slot[0] = ds_map_create()
ds_map_copy(_slot[0], _elem)

with ob_ui_object
if place_meeting(x, y, fr_evol_node) {
	_elem[? "x"] = x - fr_evol_node.x
	_elem[? "y"] = y - fr_evol_node.y
	_elem[? "xs"] = image_xscale
	_elem[? "ys"] = image_yscale
	_elem[? "ob"] = object_index
//	_elem[? "param"] = parameter_name
	
	other._slot[_count] = ds_map_create()
	ds_map_copy(other._slot[_count], _elem)
	_count++
}
#endregion

ds_map_destroy(_elem)

xstep = 0
ystep = 0

function enum_children(_name) {
	var _ystep
	
	var _node = evolution_tree[? _name]
	xstep++
	_ystep = 0
	var _frame = sc_create_slot_composed(xstep*128, _ystep*96 + 96, _name, _slot, ob_frame)
	_frame.visible = false
	for (var i=0; i<array_length(_node.children); i++) {
		_ystep++
		enum_children(_node.children[i])
	}
	
	if _ystep > ystep
		ystep = _ystep
}


enum_children(evolution_tree[? _cur_name].base)





sc_refresh_ui()


