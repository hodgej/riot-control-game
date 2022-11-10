extends "res://classes/unit.gd"

onready var body = get_node("body")


var speed = 50


func _process(delta):
	if ! (path.empty()): # NOT
		velocity = navigate()
		velocity *= speed
	else:
		velocity = Vector2(0, 0)
	
	body.rotation = lerp_angle(body.rotation, get_node("lerpAssist").rotation, .1)
	move_and_slide(velocity)
