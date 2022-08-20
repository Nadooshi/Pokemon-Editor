function sc_new_item() {
	var _result = ds_map_create()
	_result[? "name"] =			""
	_result[? "picture"] =		0
	_result[? "element"] =		_ELEMENTAL.none
	_result[? "item type"] =	_ITEM_TYPE.berry
	_result[? "effect type"] =	0 //_EFFECT_BERRY_TYPE or _EFFECT_POITION_TYPE or _EFFECT_ARTIFACT_TYPE
	_result[? "part count"] = 1
	_result[? "value"] = 0
	_result[? "stackable"] = true
	_result[? "time"] = 0
	
	return _result
}
