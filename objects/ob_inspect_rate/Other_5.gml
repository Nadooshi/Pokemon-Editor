/// @desc
fname = -1
switch room_mode {
	case 1:
		fname = file_text_open_write("log_action_" + current_action[? "name"] + ".txt")
		break;
	case 2:
		fname = file_text_open_write("log_pokemon_" + current_pokemon[? "title"] + ".txt")
		break;
	case 3:
		fname = file_text_open_write("log_state_" + dedicated_map[? "name"] + ".txt")
		break;
}
if fname = -1 {
	show_message("Log file not created!")
	exit
}

var _log = ""
for (var i = 0; i < ds_list_size(logging); i ++){
		
	_log = ds_list_find_value(logging, i)
	file_text_write_string(fname, _log)
	file_text_writeln(fname)

}
ds_list_destroy(logging)
file_text_close(fname)
