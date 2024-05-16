extends Node

const GEORGE = "GEORGE"
const GOBLIN = "GOBLIN"

var list : Array[CharacterPreset] = []

func getPreset(presetName : String) -> CharacterPreset:
	var list = getList()
	
	for character in list:
		if character.characterName == presetName:
			return character
	
	return null

func getList() -> Array[CharacterPreset]:
	if list.size() > 0:
		return list
	
	var mc = MoveConstants
	var ccc = CharacterClassConstants
	
	list.append(CharacterPreset.new(
		GEORGE, #characterName: String,
		"A valiant fighter, brave and unrelented. Slightly transphobic.",#character Description : String
		"res://textures/icon.svg",#Sprite Path
		ccc.RANGER, #characterClass : String,
		2, #startingLevel : int,
		20, #maxHealth: int,
		6, #maxMana: int,
		6, #ATK: int,
		4, #SPD: int,
		8, #DEF: int,
		1, #ACR: int,
		#Starting Moves
		[]
		)
	)
	
	list.append(CharacterPreset.new(
		GOBLIN, #characterName: String,
		"Its a goblin, about as dumb as it gets.",#character Description : String
		"res://textures/icon.svg",#Sprite Path
		ccc.BASE_ENEMY, #characterClass : String,
		1, #startingLevel : int,
		15, #maxHealth: int,
		0, #maxMana: int,
		3, #ATK: int,
		7, #SPD: int,
		2, #DEF: int,
		1, #ACR: int,
		#Starting Moves
		[mc.STAB_WEAKNESS]
		)
	)
	
	
	return list
