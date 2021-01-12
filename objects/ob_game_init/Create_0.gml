/// @desc Init values
#region Elemental

enum _ELEMENTAL {
	white,
	dark,
	flame,
	water,
	ground,
	psy,
	poison,
	electric,
	wind,
	lunar,
	solar,
	flesh, 
	ghost,
	plant,
	steel,
	rock,	
	furry,   // пушистый	
	mystic,
	ancient, // древний
	shielded,  // панцирный
	marine,  // водоплавающий
	bird,
	cosmic,
	spike,
	frozen,
	insect,
	dragon,
	robotic,
	muddy,
	woody,
	none,
	count    // чтобы узнать количество значений
}

globalvar elemental_text
var i=0
elemental_text[i++] = "white"
elemental_text[i++] = "dark"
elemental_text[i++] = "flame"
elemental_text[i++] = "water"
elemental_text[i++] = "ground"
elemental_text[i++] = "psy"
elemental_text[i++] = "poison"
elemental_text[i++] = "electric"
elemental_text[i++] = "wind"
elemental_text[i++] = "lunar"
elemental_text[i++] = "solar"
elemental_text[i++] = "flesh" 
elemental_text[i++] = "ghost"
elemental_text[i++] = "plant"
elemental_text[i++] = "steel"
elemental_text[i++] = "rock"
elemental_text[i++] = "furry"	// пушистый	
elemental_text[i++] = "mystic"
elemental_text[i++] = "ancient"	// древний
elemental_text[i++] = "shielded"	// панцирный
elemental_text[i++] = "marine"	// водоплавающий
elemental_text[i++] = "bird"
elemental_text[i++] = "cosmic"
elemental_text[i++] = "spike"
elemental_text[i++] = "frozen"
elemental_text[i++] = "insect"
elemental_text[i++] = "dragon"
elemental_text[i++] = "robotic"
elemental_text[i++] = "muddy"
elemental_text[i++] = "woody"
elemental_text[i++] = "none"

globalvar elemental_colour
var i=0

elemental_colour[i++] = make_colour_rgb(255,255,255)		//white
elemental_colour[i++] = make_colour_rgb(45,45,45)		//dark
elemental_colour[i++] = make_colour_rgb(255,110,10)		//flame
elemental_colour[i++] = make_colour_rgb(70,70,255)		//water
elemental_colour[i++] = make_colour_rgb(127,90,38)		//ground
elemental_colour[i++] = make_colour_rgb(255,100,100)		//psy
elemental_colour[i++] = make_colour_rgb(10,160,100)		//poison
elemental_colour[i++] = make_colour_rgb(255,255,0)		//electric
elemental_colour[i++] = make_colour_rgb(255,230,190)		//wind
elemental_colour[i++] = make_colour_rgb(196,200,255)		//lunar
elemental_colour[i++] = make_colour_rgb(255,255,150)		//solar
elemental_colour[i++] = make_colour_rgb(160,0,15)		//flesh
elemental_colour[i++] = make_colour_rgb(109,8,160)		//ghost
elemental_colour[i++] = make_colour_rgb(170,255,0)		//plant
elemental_colour[i++] = make_colour_rgb(255,246,204)		//steel
elemental_colour[i++] = make_colour_rgb(50,38,15)		//rock
elemental_colour[i++] = make_colour_rgb(127,120,102)		//furry
elemental_colour[i++] = make_colour_rgb(250,0,255)		//mystic
elemental_colour[i++] = make_colour_rgb(165,165,255)		//ancient
elemental_colour[i++] = make_colour_rgb(166,170,121)		//shielded
elemental_colour[i++] = make_colour_rgb(12,12,127)		//marine
elemental_colour[i++] = make_colour_rgb(127,100,100)		//bird
elemental_colour[i++] = make_colour_rgb(211,2,103)		//cosmic
elemental_colour[i++] = make_colour_rgb(97,217,229)		//spike
elemental_colour[i++] = make_colour_rgb(186,255,240)		//frozen
elemental_colour[i++] = make_colour_rgb(162,204,95)		//insect
elemental_colour[i++] = make_colour_rgb(225,0,0)			//dragon
elemental_colour[i++] = make_colour_rgb(110,121,127)		//robotic
elemental_colour[i++] = make_colour_rgb(127,114,94)		//muddy
elemental_colour[i++] = make_colour_rgb(127,55,0)		//woody
elemental_colour[i++] = make_colour_rgb(255,255,255)		//none

#endregion

//////////////////////////////////

#region Material
enum _MATERIAL {
	white,
	dark,
	flame,
	water,
	ground,
	psy,
	poison,
	electric,
	wind,
	lunar,
	solar,
	flesh, 
	ghost,
	plant,
	steel,
	rock,	
	furry,   // пушистый	
	mystic,
	ancient, // древний
	shielded,  // панцирный
	marine,  // водоплавающий
	bird,
	cosmic,
	spike,
	frozen,
	insect,
	dragon,
	robotic,
	muddy,
	woody,
	none,
	count    // чтобы узнать количество значений
}

globalvar material_text
var i=0
material_text[i++] = "white"
material_text[i++] = "dark"
material_text[i++] = "flame"
material_text[i++] = "water"
material_text[i++] = "ground"
material_text[i++] = "psy"
material_text[i++] = "poison"
material_text[i++] = "electric"
material_text[i++] = "wind"
material_text[i++] = "lunar"
material_text[i++] = "solar"
material_text[i++] = "flesh" 
material_text[i++] = "ghost"
material_text[i++] = "plant"
material_text[i++] = "steel"
material_text[i++] = "rock"
material_text[i++] = "furry"	// пушистый	
material_text[i++] = "mystic"
material_text[i++] = "ancient"	// древний
material_text[i++] = "shielded"	// панцирный
material_text[i++] = "marine"	// водоплавающий
material_text[i++] = "bird"
material_text[i++] = "cosmic"
material_text[i++] = "spike"
material_text[i++] = "frozen"
material_text[i++] = "insect"
material_text[i++] = "dragon"
material_text[i++] = "robotic"
material_text[i++] = "muddy"
material_text[i++] = "woody"
material_text[i++] = "none"

globalvar material_colour
var i=0

material_colour[i++] = make_colour_rgb(255,255,255)		//white
material_colour[i++] = make_colour_rgb(45,45,45)		//dark
material_colour[i++] = make_colour_rgb(255,110,10)		//flame
material_colour[i++] = make_colour_rgb(70,70,255)		//water
material_colour[i++] = make_colour_rgb(127,90,38)		//ground
material_colour[i++] = make_colour_rgb(255,100,100)		//psy
material_colour[i++] = make_colour_rgb(10,160,100)		//poison
material_colour[i++] = make_colour_rgb(255,255,0)		//electric
material_colour[i++] = make_colour_rgb(255,230,190)		//wind
material_colour[i++] = make_colour_rgb(196,200,255)		//lunar
material_colour[i++] = make_colour_rgb(255,255,150)		//solar
material_colour[i++] = make_colour_rgb(160,0,15)		//flesh
material_colour[i++] = make_colour_rgb(109,8,160)		//ghost
material_colour[i++] = make_colour_rgb(170,255,0)		//plant
material_colour[i++] = make_colour_rgb(255,246,204)		//steel
material_colour[i++] = make_colour_rgb(50,38,15)		//rock
material_colour[i++] = make_colour_rgb(127,120,102)		//furry
material_colour[i++] = make_colour_rgb(250,0,255)		//mystic
material_colour[i++] = make_colour_rgb(165,165,255)		//ancient
material_colour[i++] = make_colour_rgb(166,170,121)		//shielded
material_colour[i++] = make_colour_rgb(12,12,127)		//marine
material_colour[i++] = make_colour_rgb(127,100,100)		//bird
material_colour[i++] = make_colour_rgb(211,2,103)		//cosmic
material_colour[i++] = make_colour_rgb(97,217,229)		//spike
material_colour[i++] = make_colour_rgb(186,255,240)		//frozen
material_colour[i++] = make_colour_rgb(162,204,95)		//insect
material_colour[i++] = make_colour_rgb(225,0,0)			//dragon
material_colour[i++] = make_colour_rgb(110,121,127)		//robotic
material_colour[i++] = make_colour_rgb(127,114,94)		//muddy
material_colour[i++] = make_colour_rgb(127,55,0)		//woody
material_colour[i++] = make_colour_rgb(255,255,255)		//none


#endregion

//////////////////////////////////

#region ATTACK SETUP
 
enum _ATTACK_TYPE {
	melee,
	range,
	aura,
	front,
	lunge,     // выпад
	mortar,    // ballistic traectory
	pool,
	cloud,
	wave,
	barrier,
	ray,
	swoop
}
globalvar attack_type_text
var i=0
attack_type_text[i++] = "melee"
attack_type_text[i++] = "range"
attack_type_text[i++] = "aura"
attack_type_text[i++] = "front"
attack_type_text[i++] = "lunge"
attack_type_text[i++] = "mortar"
attack_type_text[i++] = "pool"
attack_type_text[i++] = "cloud"
attack_type_text[i++] = "wave"
attack_type_text[i++] = "barrier"
attack_type_text[i++] = "ray"
attack_type_text[i++] = "swoop"

enum _ATTACK_AFFECT {
	friend = 1,
	enemy  = 2,
	itself = 4
}
globalvar attack_affect_text
var i=0
attack_affect_text[_ATTACK_AFFECT.friend] = "friend"
attack_affect_text[_ATTACK_AFFECT.enemy] = "enemy"
attack_affect_text[_ATTACK_AFFECT.itself] = "itself"

enum _BULLET_PH {
	custom,
	soft,
	chain,
	piercer,
	bowl
}
globalvar bullet_physic_text
var i = 0
bullet_physic_text[i++] = "(Custom) Save position"
bullet_physic_text[i++] = "Blow away by wind"
bullet_physic_text[i++] = "Chain reaction"
bullet_physic_text[i++] = "No collision"
bullet_physic_text[i++] = "Push players"

enum _ATTACK_TG {
	air			= 1,
	ground		= 2,
	underground = 4
}

globalvar attack_target_text
var i=0
attack_target_text[_ATTACK_TG.air	 	]  = "air"
attack_target_text[_ATTACK_TG.ground	]  = "ground"
attack_target_text[_ATTACK_TG.underground] = "underground"

#endregion

//////////////////////////////////
enum _SIZE {
	tiny,
	normal,
	big,
	giant
}
globalvar size_text var;
size_text[_SIZE.tiny	] = "tiny"
size_text[_SIZE.normal	] = "normal"
size_text[_SIZE.big		] = "big"
size_text[_SIZE.giant	] = "giant"

//////////////////////////////////
enum _FORCE {
	paltry,
	frail,
	helpless,
	preferred,
	reliable,
	strong,
	selective,
	elite,
	legendary,
	incredible
}
globalvar force_text var;
force_text[_FORCE.paltry]	 = "Paltry"
force_text[_FORCE.frail]	 = "Frail"
force_text[_FORCE.helpless]	 = "Helpless"
force_text[_FORCE.preferred] = "Preferred"
force_text[_FORCE.reliable]	 = "Reliable"
force_text[_FORCE.strong]	 = "Strong"
force_text[_FORCE.selective] = "Selective"
force_text[_FORCE.elite]	 = "Elite"
force_text[_FORCE.legendary] = "Legendary"
force_text[_FORCE.incredible]= "Incredible"
//////////////////////////////////

globalvar pic_rate var;
pic_rate[0] = sp_rating_0
pic_rate[1] = sp_rating_1
pic_rate[2] = sp_rating_2
pic_rate[3] = sp_rating_3
pic_rate[4] = sp_rating_4
pic_rate[5] = sp_rating_5
pic_rate[6] = sp_rating_6

globalvar action_list; // action names
action_list = ds_map_create()
globalvar action_list_count;
action_list_count = 0
globalvar ability_list;
ability_list = ds_map_create()
globalvar ability_count;
globalvar pokemon_list;  // pokemon names
pokemon_list = ds_map_create()
globalvar pokemon_list_count;
pokemon_list_count = 0

globalvar current_action;
current_action = ds_map_create()
globalvar current_ability;
current_ability = ds_map_create()
globalvar current_pokemon;
current_pokemon = ds_map_create()

globalvar p_stage;
p_stage = ds_map_create()

globalvar dedicated_map;   // used only inside single room (editor)
globalvar previous_map;   // for highlighting changes in dedicated_map
dedicated_map = noone
previous_map = ds_map_create()

globalvar ability_slot;
ability_slot = 0

globalvar action_slot;
action_slot = 0

globalvar element_slot;
element_slot = 0

globalvar element_table;
element_table = array_create(_ELEMENTAL.count-1)
for (var i=0; i<array_length_1d(element_table); i++)
	element_table[i] = array_create(3, _ELEMENTAL.none)

globalvar popup_appeared; popup_appeared = false

sc_init_globals()

globalvar path;
path = get_save_filename("*.ini", "pokedex.ini")
if path = "" {
	game_end()
	exit
}

bini_load(path)

ds_map_read(action_list, bini_sections[? "actions"][? "action_list"])
action_list_count = ds_map_size(action_list)
ds_map_read(ability_list, bini_sections[? "abilities"][? "ability_list"])
ability_count = ds_map_size(ability_list)	
ds_map_read(pokemon_list, bini_sections[? "pokemons"][? "pokemon_list"])
pokemon_list_count = ds_map_size(pokemon_list)
var _arr = 0
if ds_map_exists(bini_sections, "element_table")
for (var i=0; i<array_length_1d(element_table); i++) {
	_arr = array_from_string( bini_sections[? "element_table"][? string(i)])
	element_table[i] = _arr
}

globalvar logging;
logging = ds_list_create()



// Get max levels from predecessors
sc_get_p_stage()
