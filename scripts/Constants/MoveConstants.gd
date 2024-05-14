extends Node

const PUNCH = "PUNCH"
const SHOOT_ARROW = "SHOOT_ARROW"
const WEAKEN = "WEAKEN"
const STRENGTHEN = "STRENGTHEN"
const BLIND_RAGE = "BLIND_RAGE"
const HEAL = "HEAL"

var list : Array[Move] = []

func getPreset(moveName : String) -> Move:
	var list = getList()
	
	for move in list:
		if move.moveName == moveName:
			return move
	
	return null

func getList() -> Array[Move]:
	if list.size() > 0:
		return list
	
	list.append(Move.new(
			PUNCH, #name
			1, #maxTargets
			true, #retargetable
			false, #defaultTargetAllEnemies
			false, #defaultTargetAllAllies
			func (this : Move):
				this.targets[0].takeDamage(4 + this.myOwner.status.getStrength())
				pass
				, #apply lambda, what it does when it's applied. 
			#code that it runs by default when selected.
		)
	)
	
	list.append(Move.new(
			SHOOT_ARROW, #name
			1, #maxTargets
			true, #retargetable
			false, #defaultTargetAllEnemies
			false, #defaultTargetAllAllies
			func (this : Move):
				this.targets[0].takeDamage(8 + this.myOwner.status.getAccuracy())
				pass
				, #apply lambda, what it does when it's applied. 
			#code that it runs by default when selected.
		)
	)
	
	return list

