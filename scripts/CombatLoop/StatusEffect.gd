extends Object

class_name StatusEffect

func _init(statusName_arg: String, description_arg: String, initLambda_arg: Callable = initLambda, effect_arg: Callable = effect) -> void:
	statusName = statusName_arg
	description = description_arg
	effect = effect_arg

@export var statusName : String
@export var description : String

var amount : int = 0

#the lambda this runs when it is created. This is for initializing.
var initLambda : Callable = func(status):
	pass

#the effect that the status has every round
var effect : Callable = func(status,amount : int):
	pass

func decrement():
	amount = max(0,amount - 1)


