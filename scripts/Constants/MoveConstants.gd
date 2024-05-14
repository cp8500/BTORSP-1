extends Object

const PUNCH = "PUNCH"
const SHOOT_ARROW = "SHOOT_ARROW"
const WEAKEN = "WEAKEN"
const STRENGTHEN = "STRENGTHEN"
const BLIND_RAGE = "BLIND_RAGE"

var list : Array[Move] = []

func getPreset(moveName : String) -> Move:
	var list = getList()
	
	for move in list:
		if character.moveName == moveName:
			return move
	
	return null

func getList() -> Array[Move]:
	if list.size() > 0:
		return list
	
	list.append(CharacterPreset.new()
	
	return list

