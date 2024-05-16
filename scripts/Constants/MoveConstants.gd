extends Node

#Fighter Moves
const PUNCH = "PUNCH"
const STRENGTHEN = "STRENGTHEN"
const BLIND_RAGE = "BLIND_RAGE"
const RECKLESS_CHARGE = "RECKLESS_CHARGE"

#Ranger Moves
const SHOOT_ARROW = "SHOOT_ARROW"
const POISION_ARROW = "POISION_ARROW"
const BLOODY_ARROW = "BLOODY_ARROW"


#Healer Moves
const HEAL = "HEAL"
const WEAKEN = "WEAKEN"


# gambler moves
const ROULETTE = "ROULETTE"
const HANDLE = "HANDLE"
const COUNT = "COUNT"

# goblin moves
const STAB = "STAB"
const STAB_WEAKNESS = "STAB_WEAKNESS"

# bug moves
const GLITCH = "GLITCH"
const BREAK = "BREAK";





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
			"Deals 4 + STRENGTH damage.", #Summary
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
			"Deals 8 + ACCURACY damage.",
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
	
	list.append(Move.new(
			STAB, #name
			"Deals 8 + STRENGTH / 2 damage.", #Summary
			1, #maxTargets
			true, #retargetable
			false, #defaultTargetAllEnemies
			false, #defaultTargetAllAllies
			func (this : Move):
				this.targets[0].takeDamage(8 + this.myOwner.status.getStrength() / 2)
				pass
				, #apply lambda, what it does when it's applied. 
			#code that it runs by default when selected.
		)
	)
	
	list.append(Move.new(
			STAB_WEAKNESS, #name
			"Deals 7 + STRENGTH / 3 damage, applies +2 Weakness", #Summary
			1, #maxTargets
			true, #retargetable
			false, #defaultTargetAllEnemies
			false, #defaultTargetAllAllies
			func (this : Move):
				this.targets[0].takeDamage(7 + this.myOwner.status.getStrength() / 3)
				this.targets[0].status.apply(StatusConstants.WEAK, 2)
				pass
				, #apply lambda, what it does when it's applied. 
			#code that it runs by default when selected.
		)
	)
	
	list.append(Move.new(
			GLITCH, #name
			"Deals 10 + STRENGTH / 2 damage.", #Summary
			1, #maxTargets
			true, #retargetable
			false, #defaultTargetAllEnemies
			false, #defaultTargetAllAllies
			func (this : Move):
				this.targets[0].takeDamage(10 + this.myOwner.status.getStrength() / 2)
				pass
				, #apply lambda, what it does when it's applied. 
			#code that it runs by default when selected.
		)
	)
	
	list.append(Move.new(
			BREAK, #name
			"Lowers targets deffense and deals 5 damage.", #Summary
			1, #maxTargets
			true, #retargetable
			false, #defaultTargetAllEnemies
			false, #defaultTargetAllAllies
			func (this : Move):
				this.targets[0].takeDamage(5)
				#defense lowering needs to be coded
				pass
				, #apply lambda, what it does when it's applied. 
			#code that it runs by default when selected.
		)
	)
	
	list.append(Move.new(
			ROULETTE, #name
			"Deals a random amount of damage from 0 to 36 * level / 2.", #Summary
			1, #maxTargets
			true, #retargetable
			false, #defaultTargetAllEnemies
			false, #defaultTargetAllAllies
			func (this : Move):
				#make random, 0 - 36 later. Also need to determine how damage wants to be calculated, weateher by user lv or target lv, or some other way
				this.targets[0].takeDamage(17 * (this.targets[0].level / 2))
				pass
				, #apply lambda, what it does when it's applied. 
			#code that it runs by default when selected.
		)
	)
	
	list.append(Move.new(
			HANDLE, #name
			"Deals damage to all enamies, 5 + STR / targets.count.", #Summary
			1, #maxTargets
			true, #retargetable
			true, #defaultTargetAllEnemies
			false, #defaultTargetAllAllies
			func (this : Move):
				for x in this.targets:
					this.targets[x].takeDamage(5 + this.myOwner.status.getStrength() / this.targets.size())
				
				pass
				, #apply lambda, what it does when it's applied. 
			#code that it runs by default when selected.
		)
	)
	
	list.append(Move.new(
			COUNT, #name
			"ATK +1 and ACC +1.", #Summary
			1, #maxTargets
			false, #retargetable
			false, #defaultTargetAllEnemies
			false, #defaultTargetAllAllies
			
			func (this : Move):
				#acc and atk increase by one stage
				
				pass
				, #apply lambda, what it does when it's applied. 
			#code that it runs by default when selected.
			func (this : Move):
				this.targets.clear()
				this.targets.append(this.myOwner)
				pass
				,
		)
	)
	
	return list

