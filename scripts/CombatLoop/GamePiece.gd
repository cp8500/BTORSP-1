extends Object

class_name GamePiece



var characterClass : CharacterClass

var level = 0

var stage : Stage

var name = ""

#moves is a list of strings
var moves : Array[String] = []



var status : Status = Status.new()


var belongsToPlayer = true

func getEnemies():
	return stage.enemyPieces if belongsToPlayer else stage.playerPieces
func getAllies():
	return stage.enemyPieces if !belongsToPlayer else stage.playerPieces
func getEveryone():
	var everyone : Array = getEnemies()
	everyone.append_array(getAllies())
	return everyone

func levelUp():
	characterClass.levelPieceUp(self)

func takeDamage(amount : int):
	status.takeDamage(amount)

func hasMove(move : String):
	for myMove in moves:
		if myMove == move:
			return true
	
	return false

func onTurnEnd():
	
	
	
	pass

