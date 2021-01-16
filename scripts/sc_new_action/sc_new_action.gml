/// @desc 
function sc_new_action() {

	var result = ds_map_create()

	ds_map_add(result, "name", "")
	ds_map_add(result, "type", _ATTACK_TYPE.melee)
	ds_map_add(result, "bullet_phys", _BULLET_PH.custom)
	ds_map_add(result, "affect", _ATTACK_AFFECT.enemy)  // combination of _ATTACK_AFFECT
	ds_map_add(result, "range", 0)
	ds_map_add(result, "level", 0)
	ds_map_add(result, "act_force",4)
	ds_map_add(result, "radius", 0)
	ds_map_add(result, "warmup", 0)
	ds_map_add(result, "delay", 0)
	ds_map_add(result, "accuracy", 1.0001)
	ds_map_add(result, "ap", 0)
	ds_map_add(result, "damage", 0)
	ds_map_add(result, "dmg_element", 0)
	ds_map_add(result, "dmg_material", 0)
	ds_map_add(result, "element", _ELEMENTAL.white)
	ds_map_add(result, "material", _MATERIAL.white)
	ds_map_add(result, "repeatable", true)
	ds_map_add(result, "tgFrom", _ATTACK_TG.ground) // combination of _ATTACK_TG 
	ds_map_add(result, "tgTo", _ATTACK_TG.ground)   // combination of _ATTACK_TG 
	ds_map_add(result, "anim", "")    // name of sprite asset ("sp_..")
	ds_map_add(result, "p_anim", "")  // name of sprite asset ("sp_..")
	ds_map_add(result, "ex_anim", "") // name of sprite asset ("sp_..")

	ds_map_add(result, "active", "")

	ds_map_add(result, "free_value", -1) // Free value for some needs
	ds_map_add(result, "rating", 0)	// rating action 0-5. Over 5 not recommend
	ds_map_add(result, "role", _ATTACK_ROLE.debuff)

	return result



}
