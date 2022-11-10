extends KinematicBody2D


onready var nav = get_node("../Navigation2D")

var path : PoolVector2Array
var currentPathIndex = 0
var dist_thresh = 5


var velocity = Vector2(0,0)


func navTo(pos):
	path = nav.get_simple_path(global_position, pos, true)


func navigate():
	if currentPathIndex >= path.size():
		path = []
		currentPathIndex = 0
	else:
		if self.global_position.distance_to(path[currentPathIndex]) < dist_thresh:
			currentPathIndex += 1
		else:
			self.get_node("lerpAssist").look_at(path[currentPathIndex])
			return (Vector2(1,0).rotated(get_node("lerpAssist").rotation))
	return Vector2(0,0)
