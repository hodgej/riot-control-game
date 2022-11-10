extends Node2D

# Base Squad Class, Inherited by all squad types #

enum moveTypes{
	FILL = 0,
	LINE = 1,
	VERTICAL_ROW = 2,
}

var units = []
var offSetFILL = 40
var offsetAddition = 20


func moveTo(location, fillType):
	match fillType:
		moveTypes.LINE:
			
			var offset = Vector2(0,0)
			var drawing = get_node("../drawing")
			drawing.circles = []
			
			var iter = -1
			
			var diff = (location-units[0].global_position)
			var vectorTo = (diff+units[0].global_position)
			
			
			var eyes = units[0].get_node("eyes")
			eyes.look_at(vectorTo)
			eyes.rotation_degrees -= 90
			
			var TempLine = Vector2(1, 1).rotated(eyes.rotation)
			var lengthOfLine = (Vector2(1,0)*units[0].global_position.distance_to(location))
			
			for i in units:
				if abs(offset.y)+(offsetAddition*2) < lengthOfLine.x:
					
					
					drawing.line = [units[0].global_position, vectorTo]
					
					
					offset.x += offsetAddition
					var tempOffset = offset*iter
					
					
					#offset.y -= offsetAddition
					
					
					#offset = Vector2(32*iter, -32).rotated(eyes.rotation)
					var pos = (Vector2(0,1)*units[0].global_position.distance_to(location) + tempOffset).rotated(eyes.rotation)
					pos += units[0].global_position
					
					drawing.line2 = [Vector2(0,0), TempLine]
					drawing.circles.append(pos)
					
					
					i.navTo(pos)
					
					iter = -iter
				else:
					break
		
		
		moveTypes.VERTICAL_ROW:
			
			var offset = Vector2(0,0)
			var drawing = get_node("../drawing")
			drawing.circles = []
			
			var iter = -1
			
			var diff = (location-units[0].global_position)
			var vectorTo = (diff+units[0].global_position)
			
			
			var eyes = units[0].get_node("eyes")
			eyes.look_at(vectorTo)
			eyes.rotation_degrees -= 90
			
			var TempLine = Vector2(1, 1).rotated(eyes.rotation)
			var lengthOfLine = (Vector2(0,1)*units[0].global_position.distance_to(location))
			
			for i in units:
				if abs(offset.y)+(offsetAddition*2) < lengthOfLine.y:
					
					
					drawing.line = [units[0].global_position, vectorTo]
					
					
					
					offset.x = offsetAddition*iter
					
					var tempOffset = offset
					offset.x = tempOffset.x
					
					offset.y -= offsetAddition
					
					
					#offset = Vector2(32*iter, -32).rotated(eyes.rotation)
					var pos = (lengthOfLine + offset).rotated(eyes.rotation)
					pos += units[0].global_position
					
					drawing.line2 = [Vector2(0,0), TempLine]
					drawing.circles.append(pos)
					
					i.navTo(pos)
					
					iter = -iter
				else:
					break
