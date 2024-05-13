extends Node

class_name statusEffect

var description : String

var amount = 0

#the lambda this runs when it is created. This is for initializing.
var initLambda : Callable = func(statuses : Status):
	pass

#the effect that the status has every round
var effect : Callable = func(statuses : Status,amount : int):
	pass



