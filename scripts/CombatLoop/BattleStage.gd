extends Node

class_name Stage

#the player's gamepieces
var playerPieces

#the enemy's pieces
var enemyPieces

@export var encounterName : String = ""

var encounter : Encounter

func _ready():
	
	encounter = EncounterConstants.getConstant(encounterName) 
	
	
