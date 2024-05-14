extends Object

class_name GamePiece

enum Moves {
	dog,
	cat,
	orphan
}

var myMoves : Moves

var stage : Stage

var name = ""

var moves = []



var status : Status


var belongsToPlayer = true

func getEnemies():
	return stage.enemyPieces if belongsToPlayer else stage.playerPieces
func getAllies():
	return stage.enemyPieces if !belongsToPlayer else stage.playerPieces
func getEveryone():
	var everyone : Array = getEnemies()
	everyone.append_array(getAllies())
	return everyone



func onTurnEnd():
	
	
	
	pass

