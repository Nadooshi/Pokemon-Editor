/// @desc


// Create ability slot

var slot_elements_count;
var _elem = ds_map_create()

ability_slot = []
slot_elements_count = 1

_elem[? "x"] = 0
_elem[? "y"] = 0
_elem[? "xs"] = frame_ability.image_xscale
_elem[? "ys"] = frame_ability.image_yscale
_elem[? "ob"] = ob_frame_ability
_elem[? "param"] = ""

ability_slot[0] = ds_map_create()
ds_map_copy(ability_slot[0], _elem)

with ob_ui_object
if place_meeting(x, y, frame_ability) {
	_elem[? "x"] = x - frame_ability.x
	_elem[? "y"] = y - frame_ability.y
	_elem[? "xs"] = image_xscale
	_elem[? "ys"] = image_yscale
	_elem[? "ob"] = object_index
	_elem[? "param"] = parameter_name
	
	ability_slot[slot_elements_count] = ds_map_create()
	ds_map_copy(ability_slot[slot_elements_count], _elem)
	slot_elements_count++
}

// Create action slot

ds_map_clear(_elem)

action_slot = []
slot_elements_count = 1

_elem[? "x"] = 0
_elem[? "y"] = 0
_elem[? "xs"] = frame_action.image_xscale
_elem[? "ys"] = frame_action.image_yscale
_elem[? "ob"] = ob_frame_action
_elem[? "param"] = ""

action_slot[0] = ds_map_create()
ds_map_copy(action_slot[0], _elem)

with ob_ui_object
if place_meeting(x, y, frame_action) {
	_elem[? "x"] = x - frame_action.x
	_elem[? "y"] = y - frame_action.y
	_elem[? "xs"] = image_xscale
	_elem[? "ys"] = image_yscale
	_elem[? "ob"] = object_index
	_elem[? "param"] = parameter_name
	
	action_slot[slot_elements_count] = ds_map_create()
	ds_map_copy(action_slot[slot_elements_count], _elem)
	slot_elements_count++
}


// Create element slot

ds_map_clear(_elem)

element_slot = []
slot_elements_count = 1

_elem[? "x"] = 0
_elem[? "y"] = 0
_elem[? "xs"] = frame_element.image_xscale
_elem[? "ys"] = frame_element.image_yscale
_elem[? "ob"] = ob_frame_element_table
_elem[? "param"] = ""

element_slot[0] = ds_map_create()
ds_map_copy(element_slot[0], _elem)

with ob_ui_object
if place_meeting(x, y, frame_element) {
	_elem[? "x"] = x - frame_element.x
	_elem[? "y"] = y - frame_element.y
	_elem[? "xs"] = image_xscale
	_elem[? "ys"] = image_yscale
	_elem[? "ob"] = object_index
	_elem[? "param"] = parameter_name
	
	element_slot[slot_elements_count] = ds_map_create()
	ds_map_copy(element_slot[slot_elements_count], _elem)
	slot_elements_count++
}


// finalize
ds_map_destroy(_elem)
