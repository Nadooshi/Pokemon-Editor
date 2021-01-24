/// @desc

switch room_mode {
	case 1:{
		ds_list_clear(logging)
		current_rate = sc_rate_action(current_action, aux_value)
		break;
	}
	case 2: {
		ds_list_clear(logging)
		current_rate = sc_rate_pokemon(current_pokemon)
		break;
	}
}
if round(old_rate * 0.01) != round(current_rate*0.01)
	with ob_rating_num {
		image_index = 0
		image_speed = 1	
	}

if current_rate <= 0 
	with ob_rating_num 
		sprite_index = pic_rate[0]
if current_rate > 0	&& current_rate <= 100
	with ob_rating_num 
		sprite_index = pic_rate[1]
if current_rate > 100	&& current_rate <= 200
	with ob_rating_num 
		sprite_index = pic_rate[2]
if current_rate > 200	&& current_rate <= 300
	with ob_rating_num 
		sprite_index = pic_rate[3]
if current_rate > 300	&& current_rate <= 400
	with ob_rating_num 
		sprite_index = pic_rate[4]
if current_rate > 400	&& current_rate <= 500
	with ob_rating_num 
		sprite_index = pic_rate[5]
if current_rate > 500
	with ob_rating_num 
		sprite_index = pic_rate[6]

switch room_mode {
	case 1: 
		ds_map_set(current_action, "rating", current_rate)

	case 2:
		ds_map_set(current_pokemon, "rating", current_rate)
}

old_rate = current_rate
	with ob_rating_num 
		caption = string(other.current_rate)

alarm_set(0, 100)
