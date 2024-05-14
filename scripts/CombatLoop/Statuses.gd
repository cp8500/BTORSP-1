extends Node

class_name Status

#by default, statusEffects decrease by 1 each turn


var myOwner : GamePiece

var ATK = 0
var attackModifiers = []

var SPD = 0
var speedModifiers = []

var DEF = 0
var defenceModifiers = []

var ACR = 0
var accuracyModifiers = []



var StartingMana = 0
var maxHealth = 1
var HP = 0
var MANA = 0

var statusEffects : Array = []

func has(effect : String):
	return getEffect(effect).amount > 0

func amount(effect : String):
	return getEffect(effect).amount

func getEffect(effect : String):
	for status in statusEffects:
		if status.statusName == status:
			return status

func _init():
	
	var sc = StatusConstants
	
	statusEffects.append(statusEffect.new(
			sc.NULL,
			"Does nothing, but why?",
			func(statusEffects : Status,amount : int): #what it will do at the end of the turn.
				pass,
		)
	)
	
	statusEffects.append(statusEffect.new(
		sc.STRONG,
		"Increases strength by X.",
		func(statusEffects : Status,amount : int):
			pass,
	)
	
	attackModifiers.append( 
	func (status,traitAmount): 
		return traitAmount + status.amount(StatusConstants.STRONG)
	)
	
	statusEffects.append(statusEffect.new(
			POISION,
			"Deals X damage each turn, ignoring DEF.",
			func(statusEffects : Status): #what it will do when it is created.
				pass,
			func(statusEffects : Status,amount : int): #what it will do at the end of the turn.
				statusEffects.takeDamageIgnoreDefence(amount)
				pass,
		),
	
	statusEffects.append(statusEffect.new(
			WEAK,
			"Halves strength.",
			func(statusEffects : Status): #what it will do when it is created.
				attackModifiers.append(
					func (status,traitAmount): 
						return traitAmount/2.0 if status.has(WEAK) else traitAmount
				)
				pass,
			func(statusEffects : Status,amount : int):
				pass,
		),
	
	statusEffects.append(statusEffect.new(
			PARALIZED,
			"Prevents attacks."
		),
	
	statusEffects.append(statusEffect.new(
			HEALING,
			"Heals X points each turn.",
			func(statusEffects : Status): #what it will do when it is created.
				pass,
			func(statusEffects : Status,amount : int): #what it will do at the end of the turn.
				statusEffects.heal(amount)
				pass,
		),
	
	statusEffects.append(statusEffect.new(
			ENRAGED,
			"Triples strength when you are at 20% health or less.",
			func(statusEffects : Status): #what it will do when it is created.
				attackModifiers.append(
					func (status,traitAmount): 
						return traitAmount * 3.0 if status.has(ENRAGED) and float(HP)/float(maxHealth) < 0.2 else traitAmount
				)
				pass,
			func(statusEffects : Status,amount : int):
				pass,
		),
	
	statusEffects.append(statusEffect.new(
			BOMBED,
			"Deals 9999 damage to the inflicted when it runs out. Deals 30 damage to all of the inflicted's enemies.",
			func(statusEffects : Status): #what it will do when it is created.
				pass,
			func(statusEffects : Status,amount : int): #what it will do at the end of the turn.
				
				#if we're about to run out
				if amount == 1:
					statusEffects.takeDamageIgnoreDefence(999)
					
					for enemy in statusEffects.myOwner.getEnemies():
						enemy.takeDamage(30)
					
				pass,
		),
	
	statusEffects.append(statusEffect.new(
			SLOW,
			"Halves speed.",
			func(statusEffects : Status): #what it will do when it is created.
				speedModifiers.append(
					func (status,traitAmount): 
						return int(traitAmount/2.0) if status.has(SLOW) else traitAmount
				)
				pass,
			func(statusEffects : Status,amount : int):
				pass,
		),
	
	statusEffects.append(statusEffect.new(
			DRUNK,
			"Halves speed, doubles strength, halves defence, and deals X sqaured damage.",
			func(statusEffects : Status): #what it will do when it is created.
				speedModifiers.append(
					func (status,traitAmount): 
						return int(traitAmount/2.0) if status.has(DRUNK) else traitAmount
				)
				
				defenceModifiers.append(
					func (status,traitAmount): 
						return int(traitAmount/2.0) if status.has(DRUNK) else traitAmount
				)
				
				attackModifiers.append(
					func (status,traitAmount): 
						return int(traitAmount * 2.0) if status.has(DRUNK) else traitAmount
				)
				pass,
			func(statusEffects : Status,amount : int):
				takeDamage(amount)
				pass,
		),
	
	statusEffects.append(statusEffect.new(
			CURSE_OF_KNOWLEDGE,
			"Deals X percent of your max health each turn.",
			func(statusEffects : Status): #what it will do when it is created.
				pass,
			func(statusEffects : Status,amount : int): #what it will do at the end of the turn.
				
				statusEffects.takeDamageIgnoreDefence(amount/100.0 * maxHealth)
				pass,
		),
	
	statusEffects.append(statusEffect.new(
			DEFENDED,
			"Increases defence by X.",
			func(statusEffects : Status): #what it will do when it is created.
				defenceModifiers.append(
					func (status,traitAmount): 
						return traitAmount + statusDict[DEFENDED]
				)
				pass,
			func(statusEffects : Status,amount : int):
				pass,
		),
	
	

func applyEffects():
	
	
	
	for status : statusEffect in statusEffects:
		status.decrement()

#strength is ADDED to physical attacks
func getStrength():
	var value = ATK
	for modifier in attackModifiers:
		value = modifier.call(self,value)
	return value

func getDefense():
	var value = DEF
	for modifier in defenceModifiers:
		value = modifier.call(self,value)
	return value

func getSpeed():
	var value = SPD
	for modifier in speedModifiers:
		value = modifier.call(self,value)
	return value

func getAccuracy():
	var value = ACR
	for modifier in accuracyModifiers:
		value = modifier.call(self,value)
	return value

func takeDamage(amount : int):
	if amount <= 0:
		return
	
	var damage = amount - getDefense()
	
	HP -= max(damage,1)
	pass

func heal(amount : int):
	HP += amount

func takeDamageIgnoreDefence(amount : int):
	
	HP -= amount
	pass

