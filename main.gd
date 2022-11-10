extends Node2D


var selectedGroup = 1
var action = 2
#line = 1, vert = 2
var canAct = true


func _input(event):
	if canAct:
		if event is InputEventMouseButton:
			if Input.is_mouse_button_pressed(1):
				print("call")
				get_node("pusherSquad%s" % str(selectedGroup)).moveTo(get_global_mouse_position(), action)
			
		
		if Input.is_action_just_pressed("ui_accept"):
			selectedGroup += 1
			selectedGroup = wrapi(selectedGroup, 1, 5)
			print(selectedGroup)
		if Input.is_action_just_pressed("ui_up"):
			action += 1
			action = wrapi(action, 1, 3)
			print(action)
		
		if !(event is InputEventMouseMotion):
			canAct = false
			$inputcooldown.start()



func _on_inputcooldown_timeout():
	canAct = true
