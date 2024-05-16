extends Node


const RANGER = "RANGER"
const HEALER = "HEALER"
const FIGHTER = "FIGHTER"

const GAMBLER = "GAMBLER"

#enemies
const BASE_ENEMY = "BASE_ENEMY"
const BUG = "BUG"

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
	
	list.append(CharacterClass.new(
		GAMBLER, #className
		5, #ATKUP = atkUp
		5, #SPDUP = spdUp
		5, # DEFUP = defUp
		1, #ACRUP = acrUp
		#SkillUnlocks = skillUnlocks
		{1 : mc.ROULETTE,
		5 : mc.HANDLE,
		10: mc.COUNT}
		)
	)
	
	list.append(CharacterClass.new(
		BASE_ENEMY, #className
		3, #ATKUP = atkUp
		2, #SPDUP = spdUp
		1, # DEFUP = defUp
		1, #ACRUP = acrUp
		#SkillUnlocks = skillUnlocks
		{1 : mc.STAB}
		)
	)
	
	list.append(CharacterClass.new(
		BUG, #className
		3, #ATKUP = atkUp
		5, #SPDUP = spdUp
		3, # DEFUP = defUp
		1, #ACRUP = acrUp
		#SkillUnlocks = skillUnlocks
		{5 : mc.BREAK}
		)
	)
	
	return list
