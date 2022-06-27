/// @desc init

function add_node(_name, _maxlvl = 0, _parent = "", _base = "") {
		if not is_struct(evolution_tree[? _name]) {
			evolution_tree[? _name] = {
				maxlvl: _maxlvl,
				children: [],
				parent: _parent,
				base: _base
			}
		} else {
			evolution_tree[? _name].base = _base
			evolution_tree[? _name].parent = _parent
			evolution_tree[? _name].maxlvl = _maxlvl
		}
}

// if new evolution selected via "evolution" parameter in current pokemon -> add node in evolution_tree
var _child_name = current_pokemon[? "evolution"]
var _cur_name = current_pokemon[? "title"]

if not is_struct(evolution_tree[? _cur_name])
	add_node(_cur_name, current_pokemon[? "maxlevel"])

// set base
var _parent_name = evolution_tree[? _cur_name].parent
if not is_undefined(_parent_name) and _parent_name != "" {
	if evolution_tree[? _parent_name].base != ""
		evolution_tree[? _cur_name].base = evolution_tree[? _parent_name].base
} else
		evolution_tree[? _cur_name].base = _cur_name

if not is_undefined(_child_name) and _child_name != "" {
	if sc_find_in_array(evolution_tree[? _cur_name].children, _child_name) = -1 {
		var _temp = ds_map_create()
		
		sc_load_pokemon(_child_name,_temp)
		var t_maxlvl = _temp[? "maxlevel"]
		array_push(evolution_tree[? _cur_name].children, _child_name)
		add_node(_child_name, t_maxlvl, _cur_name, evolution_tree[? _cur_name].base)
		current_pokemon[? "evolution"] = ""
		
		ds_map_destroy(_temp)
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

function enum_children(_name, _ystep) {
	var _node = evolution_tree[? _name]
	var _frame = sc_create_slot_composed(xstep * 128 + 96, _ystep * 96 + 96, _name, _slot, ob_frame)
	_frame.visible = false
	_ystep++
	for (var i=0; i<array_length(_node.children); i++) {
		xstep+= (i>0)
		enum_children(_node.children[i], _ystep)
	}
	
}


enum_children(evolution_tree[? _cur_name].base, 0)
// remove ob_delete_evolve for base 
with instance_find(ob_delete_evolve, 1)
	instance_destroy()
	

sc_refresh_ui()


