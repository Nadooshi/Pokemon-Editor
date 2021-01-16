///@arg type
///@arg name
///@arg type value
///@arg value
function sc_logging(_type_log, _name, _type_val, _val){

if is_undefined(_val) _val = ""

var _log = ""

_log = _type_log + " " + 
		_name + " " + 
		_type_val + " "+
		string(_val)

ds_list_add(logging, _log)


}