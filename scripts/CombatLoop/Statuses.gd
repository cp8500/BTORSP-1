extends Node

class_name Status

#by default, statuses decrease by 1 each turn

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
		STRONG : 0,
		POISION : 0,
		WEAK : 0,
		PARALIZED : 0,
		HEALING : 0,
		ENRAGED : 0,
		BOMBED : 0,
		SLOW : 0,
		DRUNK : 0,
		CURSE_OF_KNOWLEDGE : 0,
		DEFENDED : 0
	}
	

func applyEffects():
	
	takeDamage(statusDict[POISION])
	
	
	
	for key in statusDict.keys():
		statusDict[key] = max(0,statusDict[key] - 1)

#strength is ADDED to physical attacks
func getStrength():
	
	var strength = ATK + statusDict[STRONG]
	
	if has(WEAK): strength *= 0.5
	if has(DRUNK): strength *= 2
	if has(ENRAGED) and HP/maxHealth < 0.1: strength *= 3
	
	return strength
	pass

func getDefense():
	var defence = DEF + statusDict[DEFENDED]

func takeDamage(amount : float):
	
	var defence = DEF
	
	
	
	pass

func takeDamageIgnoreDefence(amount : float):
	
	
	
	
	pass

