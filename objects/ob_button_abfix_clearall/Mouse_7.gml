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
	ini_section_delete("abilities")
	var _name = ds_map_find_first(ob_fix_abilities_init.fixed_list)
	while not is_undefined(_name) {
		ini_write_string("abilities", _name, ob_fix_abilities_init.fixed_list[? _name])
		_name = ds_map_find_next(ob_fix_abilities_init.fixed_list, _name)	
	}
	ini_write_string("abilities", "ability_list", ds_map_write(ability_list))
ini_close()

show_message(
	"Fix completed \n" + 
	string(ds_map_size(bini_sections[? "abilities"])) +
	" are not represented in ability_list and are deleted"
)

