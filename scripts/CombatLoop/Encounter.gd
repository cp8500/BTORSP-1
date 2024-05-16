extends Object

class_name Encounter


# Constructor
func _init(encounterName: String, enemyNames: Array):
	self.encounterName = encounterName
	self.enemyNames = enemyNames

#Used for defining encounters and where they may happen.

var encounterName : String
var enemyNames : Array[String]

func getShells() -> Array[GamePieceShell]:
	
	var shells = []
	
	for enemyName in enemyNames:
		shells.append(preload("res://scenes/CombatLoop/game_piece_shell.tscn").instantiate())
		var currentShell : GamePieceShell = shells.back()
		
		currentShell.gamePiece = GamePiece.new()
		
		CharacterConstants.getPreset(enemyName).applyTo(currentShell.gamePiece)
		
	
	return shells

