extends Node2D

class_name GamePieceShell 

var gamePiece : GamePiece




func _on_target_button_pressed():
	
	if BattleStageGlobals.selectedPlayerMove != null:
		BattleStageGlobals.selectedPlayerMove.toggleTarget(self)
	
	pass # Replace with function body.
