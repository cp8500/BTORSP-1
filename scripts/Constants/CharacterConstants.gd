extends Object

const Ranger = "Ranger"
const Healer = "Healer"
const Fighter = "Fighter"

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
	
	list.append(CharacterPreset.new(
		"George", #characterName: String,
		char, #characterClass : String,
		2, #startingLevel : int,
		20, #maxHealth: int,
		6, #maxMana: int,
		6, #ATK: int,
		SPD: int,
		DEF: int,
		ACR: int,
		
		moves: Array
	)
	)
	
	
	
	return list
