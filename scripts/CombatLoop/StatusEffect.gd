extends Node

class_name statusEffect

func _init(statusName_arg: String, description_arg: String, effect_arg: Callable = effect) -> void:
	statusName = statusName_arg
	description = description_arg
	effect = effect_arg

@export var statusName : String
@export var description : String

var amount = 0

#the effect that the status has every round
var effect : Callable = func(statuses,amount : int):
	pass

func decrement():
	amount = max(0,amount - 1)


