extends Node


const RANGER = "RANGER"
const HEALER = "HEALER"
const FIGHTER = "FIGHTER"

var list : Array[CharacterClass] = []

func getClass(className : String) -> CharacterClass:
	var list = getList()
	
	for character in list:
		if character.ClassName == className:
			return character
	
	return null

func getList() -> Array[CharacterClass]:
	if list.size() > 0:
		return list
	
	var mc = MoveConstants
	
	list.append(CharacterClass.new(
		RANGER, #className
		2, #ATKUP = atkUp
		4, #SPDUP = spdUp
		1, # DEFUP = defUp
		10, #ACRUP = acrUp
		#SkillUnlocks = skillUnlocks
		{1 : mc.SHOOT_ARROW,
		5 : mc.SHOOT_ARROW,
		10 : mc.SHOOT_ARROW,
		15 : mc.SHOOT_ARROW,
		}
		)
	)
	
	
	
	return list
