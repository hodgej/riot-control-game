extends "res://classes/squad.gd"

export var unitRange = [1, 3]

func _process(delta):
	pass


func _ready():
	for i in range(unitRange[0],unitRange[1]+1):
		units.append(get_node("../cop%s" % str(i)))
	print(units)
