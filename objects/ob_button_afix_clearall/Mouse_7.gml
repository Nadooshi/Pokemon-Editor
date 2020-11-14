/// @desc 

// Inherit the parent event
event_inherited();

var old_path = path

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

 // Rewrite actions (save changes)
ini_open(path)
	ini_section_delete("actions")
	var _name = ds_map_find_first(ob_fix_actions_init.fixed_list)
	while not is_undefined(_name) {
		ini_write_string("actions", _name, ob_fix_actions_init.fixed_list[? _name])
		_name = ds_map_find_next(ob_fix_actions_init.fixed_list, _name)	
	}
	ini_write_string("actions", "action_list", ds_map_write(action_list))
ini_close()


show_message(
	"Fix completed \n" + 
	string(ds_map_size(bini_sections[? "actions"])) +
	" are not represented in action_list and are deleted"
)

// reload ini
bini_unload()
bini_load(path)
ds_map_read(action_list, bini_sections[? "actions"][? "action_list"])
action_list_count = ds_map_size(action_list)




