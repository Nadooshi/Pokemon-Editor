/// @desc

fname = file_text_open_write("log_action" + current_action[? "name"] + ".txt")
if fname = -1
	show_message("Log file not created!")

var _log = ""
for (var i = 0; i < ds_list_size(logging); i ++){
		
	_log = ds_list_find_value(logging, i)
	file_text_write_string(fname, _log)
	file_text_writeln(fname)

}
ds_list_destroy(logging)
file_text_close(fname)
