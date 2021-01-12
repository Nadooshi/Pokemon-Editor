///@arg type
///@arg name
///@arg type value
///@arg value
function sc_logging(argument0, argument1, argument2, argument3){

var _type_log = argument0
var _name = argument1
var _type_val = argument2
var _val = argument3

var _log = ""

_log = _type_log + " " + 
		_name + " " + 
		_type_val + 
		string(_val)

ds_list_add(logging, _log)


}