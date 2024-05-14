extends Node

class_name CharacterClassConstants

const RANGER = "RANGER"
const HEALER = "HEALER"
const FIGHTER = "FIGHTER"

var list : Array[CharacterClass] = []

func getClass(className : String) -> CharacterClass:
	var list = getList()
	
	for character in list:
		if character.characterName == className:
			return character
	
	return null

func getList() -> Array[CharacterClass]:
	if list.size() > 0:
		return list
	
	list.append(CharacterClass.new(
		RANGER, #className
		2, #ATKUP = atkUp
		4, #SPDUP = spdUp
		6, # DEFUP = defUp
		10, #ACRUP = acrUp
		#SkillUnlocks = skillUnlocks
		{}
		)
	)
	
	
	
	return list
