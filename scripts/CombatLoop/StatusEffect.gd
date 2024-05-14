extends Node

class_name statusEffect

func _init(statusName_arg: String, description_arg: String, initLambda_arg: Callable = initLambda, effect_arg: Callable = effect) -> void:
	statusName = statusName_arg
	description = description_arg
	initLambda = initLambda_arg
	effect = effect_arg

var statusName : String
var description : String

var amount = 0

#the lambda this runs when it is created. This is for initializing.
var initLambda : Callable = func(statuses : Status):
	pass

#the effect that the status has every round
var effect : Callable = func(statuses : Status,amount : int):
	pass

func decrement():
	amount = max(0,amount - 1)


