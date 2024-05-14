extends Object

class_name CharacterPreset

func _init(
	characterName: String,
	characterClass : String,
	maxHealth: int,
	maxMana: int,
	ATK: int,
	SPD: int,
	DEF: int,
	ACR: int,
	moves: Array
) -> void:
	self.characterName = characterName
	self.characterClass = characterClass
	self.maxHealth = maxHealth
	self.maxMana = maxMana
	self.ATK = ATK
	self.SPD = SPD
	self.DEF = DEF
	self.ACR = ACR
	self.moves = moves

var characterName
var characterClass

var maxHealth
var maxMana

var ATK = 0
var SPD = 0
var DEF = 0
var ACR = 0

var moves = [] #list of strings

func applyTo(gp : GamePiece):
	var st = gp.status
	
	st.ATK = ATK
	st.SPD = SPD
	st.DEF = DEF
	st.ACR = ACR
	
	st.maxHealth = maxHealth
	st.maxHealth = maxHealth
	
	gp.moves = moves
	gp.name = characterName
	
