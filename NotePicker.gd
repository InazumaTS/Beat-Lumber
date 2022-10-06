extends Node2D

var is_pressed = false
var is_collecting = false

func _ready():
	pass # Replace with function body.

func _process(delta):
	if Input.is_action_just_pressed("ui_left") or Input.is_action_just_pressed("ui_right"):
		is_pressed = true
		is_collecting = true
	else:
		is_pressed = false
		is_collecting = false
	if is_pressed:
		self.scale = Vector2(0.9,0.9)
	else:
		self.scale = Vector2(1,1)



