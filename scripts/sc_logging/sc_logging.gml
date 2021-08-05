///@arg text
///@arg name
///@arg type_value
///@arg value
function sc_logging(_text, _name, _type, _val){

var _log = ""

_log = _text
if not is_undefined(_name) 
	_log += " " + string(_name)
if not is_undefined(_type) 
	_log += " " + string(_type)
if not is_undefined(_val)
	_log += " == " + string(_val)

ds_list_add(logging, _log)


}