extends Sprite2D

var xOrigin = 0
var yOrigin = 0

var xObject = 0.0
var yObject = 0.0

var objectAngle = 45.0
var objectDistance =16.0

func _process(_delta):
	objectAngle = get_node("..").get_angle_to(get_global_mouse_position())
	
	xOrigin = get_node("..").position.x
	yOrigin = get_node("..").position.y

	xObject = objectDistance*(cos(objectAngle))
	yObject = objectDistance*(sin(objectAngle))
	position.x = xObject
	position.y = yObject
