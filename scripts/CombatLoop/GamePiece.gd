extends Node

class_name GamePiece

enum Moves {
	dog,
	cat,
	orphan
}

var myMoves : Moves

var stage : Stage

var moves = []



var status : Status


var belongsToPlayer = true

func getEnemies():
	return stage.enemyPieces if belongsToPlayer else stage.playerPieces
func getAllies():
	return stage.enemyPieces if !belongsToPlayer else stage.playerPieces

func onTurnEnd():
	
	
	
	pass

