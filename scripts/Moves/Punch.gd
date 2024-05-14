extends Move

func _init():
	
	pass
	
	

func apply():
	targets[0].HP -= 4 + myOwner.status.getStrength()
