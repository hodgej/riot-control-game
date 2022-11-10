extends Node2D


var circles = []
var line = []
var line2 = []
var line3 = []


func _process(delta):
	update()


func _draw():
	for i in circles:
		draw_circle(i, 20, Color(0,0,1,.3))
	if !line.empty():
		draw_line(line[0], line[1], Color(0,0,1,.3), 5, true)
	if !line2.empty():
		draw_line(line2[0], line2[1], Color(0,1,0,.3), 5, true)
	if !line3.empty():
		draw_line(line3[0], line3[1], Color(1,0,0,.3), 5, true)
