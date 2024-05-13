extends Node

class_name GamePiece

var stage : Stage

var moves = []

var ATK = 0
var SPD = 0
var DEF = 0
var StartingMana = 0
var Accuracy = 0

var HP = 0
var MANA = 0

var myStatuses : Statuses


var belongsToPlayer = true

func getEnemies():
	return stage.enemyPieces if belongsToPlayer else stage.playerPieces
func getAllies():
	return stage.enemyPieces if !belongsToPlayer else stage.playerPieces

func onTurnEnd():
	
	
	
	pass

func GetStrength():
	
	return attack + 
	
	pass
