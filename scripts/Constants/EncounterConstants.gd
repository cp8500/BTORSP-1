extends Node

const GEORGE_AMBUSH = "GEORGE_AMBUSH"

var list : Array[CharacterClass] = []

func getConstant(constantName : String) -> CharacterClass:
	var list = getList()
	
	for constant in list:
		if constant.encounterName == constantName:
			return constant
	
	return null

func getList() -> Array[CharacterClass]:
	if list.size() > 0:
		return list
	
	var mc = CharacterConstants
	
	list.append(Encounter.new(
		GEORGE_AMBUSH,
		[mc.GEORGE]
		)
	)
	
	
	
	return list
