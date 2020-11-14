/// @desc 

#region // Create item slot		// created: array fix_action_slot

var slot_elements_count;
var _elem = ds_map_create()

fix_action_slot = []
slot_elements_count = 1

_elem[? "x"] = 0
_elem[? "y"] = 0
_elem[? "xs"] = frame_fix.image_xscale
_elem[? "ys"] = frame_fix.image_yscale
_elem[? "ob"] = frame_fix.object_index
_elem[? "param"] = ""

fix_action_slot[0] = ds_map_create()
ds_map_copy(fix_action_slot[0], _elem)

with ob_ui_object
if place_meeting(x, y, frame_fix) {
	_elem[? "x"] = x - frame_fix.x
	_elem[? "y"] = y - frame_fix.y
	_elem[? "xs"] = image_xscale
	_elem[? "ys"] = image_yscale
	_elem[? "ob"] = object_index
	_elem[? "param"] = parameter_name
	
	other.fix_action_slot[slot_elements_count] = ds_map_create()
	ds_map_copy(other.fix_action_slot[slot_elements_count], _elem)
	slot_elements_count++
}

#endregion


#region // Scan actions			// created: map fixed_list		// edited: map bini_sections[? "actions"]

/*
if show_question("Make back up?") {
	path = get_save_filename("*.ini", "pokedex_backup.ini")
	if path = "" {
		show_message("Fix cancelled")
		path = old_path
		exit
	}
	file_copy(old_path, path)
	path = old_path
}
*/

var _name = ds_map_find_first(action_list)
while not is_undefined(_name) {
	if _name != "" and not is_undefined(bini_sections[? "actions"][? _name]) {
		fixed_list[? _name] = bini_sections[? "actions"][? _name]
		ds_map_delete(bini_sections[? "actions"], _name)
	}
	_name = ds_map_find_next(action_list, _name)
}
// refresh action_list
ds_map_clear(action_list)
_name = ds_map_find_first(fixed_list)
while not is_undefined(_name) {
	ds_map_add(action_list, _name, true)
	_name = ds_map_find_next(fixed_list, _name)
}

/* // Rewrite actions (save changes)
ini_open(path)
	ini_section_delete("actions")
	_name = ds_map_find_first(_fixed_list)
	while not is_undefined(_name) {
		ini_write_string("actions", _name, _fixed_list[? _name])
		_name = ds_map_find_next(_fixed_list, _name)	
	}
	ini_write_string("actions", "action_list", ds_map_write(action_list))
ini_close()

show_message(
	"Fix completed \n" + 
	string(ds_map_size(bini_sections[? "actions"])) + " are not represented in action_list and are deleted"
)

if ds_map_size(bini_sections[? "actions"]) > 0 
if show_question("Show list deleted items?") {
	var _arr = []
	ds_map_keys_to_array(bini_sections[? "actions"], _arr)
	show_message(string(_arr))
	
}
*/

#endregion


#region // create slot list

// bini_sections[? "actions"] map contains remaining actions that not represented in action_list
var _list = sc_map_to_list(bini_sections[? "actions"])
sc_create_slot_list(_list, fix_action_slot, frame_fix.sprite_width, 1920 + 100, 50)

with ob_frame 
	event_perform(ev_other, ev_user0)
	
#endregion
