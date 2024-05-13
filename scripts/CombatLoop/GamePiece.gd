extends Node

class_name GamePiece

var stage : Stage

var moves = []



var myStatuses : Status


var belongsToPlayer = true

func getEnemies():
	return stage.enemyPieces if belongsToPlayer else stage.playerPieces
func getAllies():
	return stage.enemyPieces if !belongsToPlayer else stage.playerPieces

func onTurnEnd():
	
	
	
	pass

