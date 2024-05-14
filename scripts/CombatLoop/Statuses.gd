extends Node

class_name Status

#by default, statuses decrease by 1 each turn

const NULL : String = "NULL" #does nothing, but why?

const STRONG : String = "STRONG" #increases ATK by #STRONG

const POISION : String = "POISION" #deals #poision damage

const WEAK : String  = "WEAK" #halves strenth after other buffs

const PARALIZED : String  = "PARALIZE" #Completely disables piece

const HEALING : String  = "HEALING" #gives #healing health per turn

const ENRAGED : String  = "ENRAGED" #Triples attack if your health is <10%. Happens before weak.

const BOMBED : String  = "BOMBED" #When bombed hits 0, you take 40000 damage and deal 30 damage to all oponents.

const SLOW : String  = "SLOW" #halves speed

const DRUNK : String  = "DRUNK" #doubles ATTACK, tenths ACR, halves DEF, deals #DRUNK ^ 2 damage

const CURSE_OF_KNOWLEDGE : String  = "CURSE_OF_KNOWLEDGE" #identical to poision except it deals % of max health

const DEFENDED = "DEFENDED" #increases defence by #DEFENDED

enum Effects {
	HEALING,
	
	
}

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

var statusDict : Dictionary

func has(effect : String):
	return statusDict[effect] > 0

func _init():
	
	statusDict = {
		NULL : statusEffect.new(
			NULL,
			"Does nothing, but why?",
			func(statuses : Status): #what it will do when it is created.
				pass,
			func(statuses : Status,amount : int): #what it will do at the end of the turn.
				pass,
		),
		STRONG : statusEffect.new(
			STRONG,
			"Increases strength by X.",
			func(statuses : Status): #what it will do when it is created.
				attackModifiers.append(
					func (status,traitAmount): 
						return traitAmount + statusDict[STRONG]
				)
				pass,
			func(statuses : Status,amount : int):
				pass,
		),
		POISION : statusEffect.new(
			POISION,
			"Deals X damage each turn, ignoring DEF.",
			func(statuses : Status): #what it will do when it is created.
				pass,
			func(statuses : Status,amount : int): #what it will do at the end of the turn.
				statuses.takeDamageIgnoreDefence(amount)
				pass,
		),
		WEAK : statusEffect.new(
			WEAK,
			"Halves strength.",
			func(statuses : Status): #what it will do when it is created.
				attackModifiers.append(
					func (status,traitAmount): 
						return traitAmount/2.0 if status.has(WEAK) else traitAmount
				)
				pass,
			func(statuses : Status,amount : int):
				pass,
		),
		PARALIZED : statusEffect.new(
			PARALIZED,
			"Prevents attacks."
		),
		HEALING : statusEffect.new(
			HEALING,
			"Heals X points each turn.",
			func(statuses : Status): #what it will do when it is created.
				pass,
			func(statuses : Status,amount : int): #what it will do at the end of the turn.
				statuses.heal(amount)
				pass,
		),
		ENRAGED : statusEffect.new(
			ENRAGED,
			"Triples strength when you are at 20% health or less.",
			func(statuses : Status): #what it will do when it is created.
				attackModifiers.append(
					func (status,traitAmount): 
						return traitAmount * 3.0 if status.has(ENRAGED) and float(HP)/float(maxHealth) < 0.2 else traitAmount
				)
				pass,
			func(statuses : Status,amount : int):
				pass,
		),
		BOMBED : statusEffect.new(
			BOMBED,
			"Deals 9999 damage to the inflicted when it runs out. Deals 30 damage to all of the inflicted's enemies.",
			func(statuses : Status): #what it will do when it is created.
				pass,
			func(statuses : Status,amount : int): #what it will do at the end of the turn.
				
				#if we're about to run out
				if amount == 1:
					statuses.takeDamageIgnoreDefence(999)
					
					for enemy in statuses.myOwner.getEnemies():
						enemy.takeDamage(30)
					
				pass,
		),
		SLOW : statusEffect.new(
			SLOW,
			"Halves speed.",
			func(statuses : Status): #what it will do when it is created.
				speedModifiers.append(
					func (status,traitAmount): 
						return int(traitAmount/2.0) if status.has(SLOW) else traitAmount
				)
				pass,
			func(statuses : Status,amount : int):
				pass,
		),
		DRUNK : statusEffect.new(
			DRUNK,
			"Halves speed, doubles strength, halves defence, and deals X sqaured damage.",
			func(statuses : Status): #what it will do when it is created.
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
			func(statuses : Status,amount : int):
				takeDamage(amount)
				pass,
		),
		CURSE_OF_KNOWLEDGE : statusEffect.new(
			CURSE_OF_KNOWLEDGE,
			"Deals X percent of your max health each turn.",
			func(statuses : Status): #what it will do when it is created.
				pass,
			func(statuses : Status,amount : int): #what it will do at the end of the turn.
				
				statuses.takeDamageIgnoreDefence(amount/100.0 * maxHealth)
				pass,
		),
		DEFENDED : statusEffect.new(
			DEFENDED,
			"Increases defence by X.",
			func(statuses : Status): #what it will do when it is created.
				defenceModifiers.append(
					func (status,traitAmount): 
						return traitAmount + statusDict[DEFENDED]
				)
				pass,
			func(statuses : Status,amount : int):
				pass,
		),
	}
	

func applyEffects():
	
	takeDamage(statusDict[POISION])
	
	
	
	for key in statusDict.keys():
		statusDict[key] = max(0,statusDict[key] - 1)

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

