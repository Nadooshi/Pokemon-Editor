/// @desc Update

layer_set_visible("_Hiding", visible)

if visible 
for (var i=0; i<ui_objects_count; i++)
with ui_objects[i] 
	event_perform(ev_other, ev_user0)
